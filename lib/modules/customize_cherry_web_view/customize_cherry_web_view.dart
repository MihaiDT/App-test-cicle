import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/api.dart';
import 'package:lines/core/helpers/fullscreen_loader.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/badges_service.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';

class CustomizeCherryWebView extends StatefulWidget {
  final String sessionToken;

  const CustomizeCherryWebView({
    super.key,
    required this.sessionToken,
  });

  @override
  State<CustomizeCherryWebView> createState() => _CustomizeCherryWebViewState();
}

class _CustomizeCherryWebViewState extends State<CustomizeCherryWebView> {
  InAppWebViewController? webViewController;

  bool isFirstPage = true;
  final rxShowSaveButton = RxBool(false);

  ValueNotifier<Color?> backButtonColor = ValueNotifier(Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TransparentAppBar(
        leading: ValueListenableBuilder(
          valueListenable: backButtonColor,
          builder: (context, value, child) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: value,
              ),
              onPressed: () => Get.back(),
            );
          },
        ),
        actions: [
          Obx(
            () => rxShowSaveButton.value
                ? InkWell(
                    onTap: () async {
                      showFullScreenLoader(
                        dismissAfter: const Duration(seconds: 6),
                      );

                      PiwikManager.trackEvent(
                        PiwikEventType.avatar,
                        action: 'configure',
                      );

                      await webViewController?.evaluateJavascript(
                        source: "save()",
                      );

                      BadgesService.triggerEvent(BadgeEvent.avatar);

                      await AuthenticationService.fetchUser();
                      Get.back();
                    },
                    child: Container(
                      color: Colors.transparent,
                      height: 40,
                      child: Center(
                        child: const TitleLarge(
                          "SALVA",
                        ).applyShaders(Get.context!),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
      body: PopScope(
        canPop: false,
        child: InAppWebView(
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            final uri = navigationAction.request.url;
            if (uri?.toString().contains('/ready') ?? false) {
              PiwikManager.trackEvent(
                PiwikEventType.avatar,
                action: 'view',
              );

              // I have to show the save button
              rxShowSaveButton.value = true;
              backButtonColor.value = null;
              return NavigationActionPolicy.CANCEL;
            }

            backButtonColor.value = Colors.white;
            return NavigationActionPolicy.ALLOW;
          },
          initialUrlRequest: URLRequest(
            url: WebUri(
              "${environment.cherryCustomizationEndpoint}/index.html?token=${widget.sessionToken}&user_id=${HiveManager.userId}",
            ),
          ),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          initialUserScripts: UnmodifiableListView<UserScript>([
            UserScript(
              source: "function save(){"
                  "document.dispatchEvent(new Event('save'));"
                  "};",
              injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
            ),
          ]),
        ),
      ),
    );
  }
}
