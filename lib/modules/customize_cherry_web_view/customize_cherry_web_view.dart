import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';

class CustomizeCherryWebView extends StatefulWidget {
  const CustomizeCherryWebView({
    super.key,
  });

  @override
  State<CustomizeCherryWebView> createState() => _CustomizeCherryWebViewState();
}

class _CustomizeCherryWebViewState extends State<CustomizeCherryWebView> {
  late final InAppLocalhostServer localhostServer;

  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TransparentAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            bool canGoBack = webViewController != null &&
                await webViewController!.canGoBack();
            if (canGoBack) {
              webViewController?.goBack();
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: PopScope(
        canPop: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri(
              "http://localhost:8080/assets/Personalizzazione Avatar/index.html?token=${HiveManager.userId}",
            ),
          ),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          initialUserScripts: UnmodifiableListView<UserScript>([
            UserScript(
              source: "function showToast(message) {  }",
              injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
            ),
          ]),
          onLoadStop: (controller, url) async {
            await controller.evaluateJavascript(
              source: "showToast('Hello from Dart!');",
            );
          },
        ),
      ),
    );
  }
}
