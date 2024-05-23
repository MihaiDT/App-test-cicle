import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/secure_storage_manager.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TransparentAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            bool canGoBack = webViewController != null;

            if (canGoBack) {
              await webViewController?.evaluateJavascript(
                source: "dispatchBackEvent()",
              );
              /*webViewController?.goBack();*/
            } else {
              /*Navigator.of(context).pop();*/
            }
          },
        ),
      ),
      body: PopScope(
        canPop: false,
        child: InAppWebView(
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            final uri = navigationAction.request.url;
            final isFirstUrl = uri != null &&
                uri.toString().startsWith(
                      "https://tinybullstudios.com/Lines/Tamagotchi/index.html",
                    );
            if (uri != null && isFirstUrl) {
              return NavigationActionPolicy.ALLOW;
            }
            print("uri");
            print(uri);
            return NavigationActionPolicy.CANCEL;
          },
          initialUrlRequest: URLRequest(
            url: WebUri(
              "https://tinybullstudios.com/Lines/Tamagotchi/index.html?token=${HiveManager.userId}&user_id=${SecureStorageManager().getToken()}",
            ),
          ),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          initialUserScripts: UnmodifiableListView<UserScript>([
            UserScript(
              source: "function dispatchBackEvent() {"
                  "document.dispatchEvent(new Event('back'));"
                  "}",
              injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
            ),
          ]),
        ),
      ),
    );
  }
}
