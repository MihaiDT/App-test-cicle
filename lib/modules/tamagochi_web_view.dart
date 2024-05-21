import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';

class TamagochiWebView extends StatefulWidget {
  const TamagochiWebView({
    super.key,
  });

  @override
  State<TamagochiWebView> createState() => _TamagochiWebViewState();
}

class _TamagochiWebViewState extends State<TamagochiWebView> {
  InAppWebViewController? webViewController;
  late final InAppLocalhostServer localhostServer;

  @override
  void initState() {
    localhostServer = InAppLocalhostServer();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await localhostServer.start();
    });
    super.initState();
  }

  @override
  void dispose() {
    localhostServer.close();
    super.dispose();
  }

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
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            final uri = navigationAction.request.url;
            if (uri != null && uri.toString().endsWith("/Tamagotchi/")) {
              return NavigationActionPolicy.ALLOW;
            }
            return NavigationActionPolicy.ALLOW;
          },
          initialUrlRequest: URLRequest(
            url: WebUri(
              "http://localhost:8080/assets/Tamagotchi/index.html?token=${HiveManager.userId}",
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
