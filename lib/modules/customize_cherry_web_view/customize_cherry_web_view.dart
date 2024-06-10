import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/api.dart';
import 'package:lines/core/helpers/fullscreen_loader.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/repository/authentication_service.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TransparentAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          Obx(
            () => rxShowSaveButton.value
                ? InkWell(
                    onTap: () async {
                      showFullScreenLoader(
                        dismissAfter: const Duration(seconds: 5),
                      );

                      await webViewController?.evaluateJavascript(
                        source: "save()",
                      );

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
            // final String loadingPageUrl = "${environment.cherryCustomizationEndpoint}/index.html";

            //   // final String firstPageUrl =
            //   //     "${environment.cherryCustomizationEndpoint}/HomePage";

            final uri = navigationAction.request.url;
            if (uri?.toString().contains('/ready') ?? false) {
              // I have to show the save button
              rxShowSaveButton.value = true;
              return NavigationActionPolicy.CANCEL;
            }

            return NavigationActionPolicy.ALLOW;
          },

          //   //   // final isFirstUrl =
          //   //   //     uri != null && uri.toString().startsWith(loadingPageUrl);

          //   //   // // If the first page is loaded, allow the navigation
          //   //   // if (uri != null && isFirstUrl) {
          //   //   //   isFirstPage = false;
          //   //   //   return NavigationActionPolicy.ALLOW;
          //   //   // }

          //   //   // if (uri != null && uri.toString().contains('/pad_change')) {
          //   //   //   // Vado al questionario di cambio assorbente
          //   //   //   Get.toNamed(Routes.gameQuiz);

          //   //   //   // Cambio assorbente
          //   //   //   webViewController?.evaluateJavascript(
          //   //   //     source: "dispatchResetPadEvent()",
          //   //   //   );
          //   //   // } else {
          //   //   //   // Set the first page to true if the first page is loaded in order to permit the back navigation
          //   //   //   if (uri != null && uri.toString().startsWith(firstPageUrl)) {
          //   //   //     isFirstPage = true;
          //   //   //   } else {
          //   //   //     isFirstPage = false;
          //   //   //   }
          //   //   // }

          //   //   // logDebug(
          //   //   //   "${environment.cherryCustomizationEndpoint}/index.html?token=${widget.sessionToken}&user_id=${HiveManager.userId}",
          //   //   // );

          //   // return NavigationActionPolicy.CANCEL;
          //   return NavigationActionPolicy.ALLOW;
          // },
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
