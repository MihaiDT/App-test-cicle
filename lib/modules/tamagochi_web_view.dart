import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/api.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/logger/log.dart';
import 'package:lines/repository/badges_service.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';

class TamagochiWebView extends StatefulWidget {
  final String sessionToken;

  const TamagochiWebView({
    super.key,
    required this.sessionToken,
  });

  @override
  State<TamagochiWebView> createState() => _TamagochiWebViewState();
}

class _TamagochiWebViewState extends State<TamagochiWebView> {
  InAppWebViewController? webViewController;

  bool isFirstPage = true;
  final rxShowBackButton = RxBool(false);

  @override
  Widget build(BuildContext context) {
    BadgesService.triggerEvent(BadgeEvent.gioco);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TransparentAppBar(
        leading: IconButton(
          icon: Obx(
            () => rxShowBackButton.value
                ? const Icon(Icons.arrow_back)
                : const SizedBox.shrink(),
          ),
          onPressed: () async {
            bool canGoBack = webViewController != null;

            if (canGoBack) {
              if (isFirstPage) {
                Navigator.of(context).pop();
              }
              await webViewController?.evaluateJavascript(
                source: "dispatchBackEvent()",
              );
            }
          },
        ),
      ),
      body: PopScope(
        canPop: false,
        child: InAppWebView(
          onPermissionRequest: (controller, permissionRequest) async {
            return PermissionResponse(action: PermissionResponseAction.GRANT);
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            final String loadingPageUrl =
                "${environment.gameEndpoint}/index.html";

            final String firstPageUrl = "${environment.gameEndpoint}/HomePage";

            final uri = navigationAction.request.url;

            final isFirstUrl =
                uri != null && uri.toString().startsWith(loadingPageUrl);

            // If the first page is loaded, allow the navigation
            if (uri != null && isFirstUrl) {
              isFirstPage = false;
              return NavigationActionPolicy.ALLOW;
            }

            // FIXME: ruttino, ruota, relax

            logDebug(uri.toString());

            if (uri != null &&
                (uri.toString().contains('BurpActivity') ||
                    uri.toString().contains('RelaxActivity') ||
                    uri.toString().contains('CartwheelActivity'))) {
              rxShowBackButton.value = false;
            } else {
              rxShowBackButton.value = true;
            }

            if (uri != null && uri.toString().contains('/pad_change')) {
              // Cambio assorbente
              webViewController?.evaluateJavascript(
                source: "dispatchResetPadEvent()",
              );

              // Vado al questionario di cambio assorbente
              Get.toNamed(Routes.gameQuiz);
            } else {
              // Set the first page to true if the first page is loaded in order to permit the back navigation
              if (uri != null && uri.toString().startsWith(firstPageUrl)) {
                isFirstPage = true;
              } else {
                isFirstPage = false;
              }
            }

            logDebug(
              "${environment.gameEndpoint}/index.html?token=${widget.sessionToken}&user_id=${HiveManager.userId}",
            );

            return NavigationActionPolicy.CANCEL;
          },
          initialUrlRequest: URLRequest(
            url: WebUri(
              "${environment.gameEndpoint}/index.html?token=${widget.sessionToken}&user_id=${HiveManager.userId}",
            ),
          ),
          onWebViewCreated: (controller) {
            webViewController = controller;
            webViewController?.evaluateJavascript(
              source: "dispatchSensors()",
            );
          },
          initialUserScripts: UnmodifiableListView<UserScript>([
            UserScript(
              source: "function dispatchBackEvent() {"
                  "document.dispatchEvent(new Event('back'));"
                  "};"
                  "function dispatchSensors() {"
                  "DeviceMotionEvent.requestPermission();"
                  "}"
                  "function dispatchResetPadEvent() {"
                  "document.dispatchEvent(new Event('reset_pad'));"
                  "};",
              injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
            ),
          ]),
        ),
      ),
    );
  }
}
