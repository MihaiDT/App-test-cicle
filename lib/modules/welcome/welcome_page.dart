import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/widgets/grid_guides.dart';

import '../../core/app_theme.dart';

import '../../widgets/layouts/app_scaffold_padding.dart';
import '../../widgets/layouts/app_scaffold_page.dart';

import '../../widgets/logos/hero_logo.dart';
import 'welcome_controller.dart';
import 'widgets/welcome_body.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppScaffoldPage(
          backgroundImage: ThemeDecoration.images.bgDark,
          scrollController: ScrollController(),
          body: AppScaffoldPadding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Expanded(
                  flex: 3,
                  child: SizedBox.shrink(),
                ),
                HeroLogo(size: min(Get.width * 0.7, Get.height * 0.3)),
                const Expanded(
                  flex: 4,
                  child: SizedBox.shrink(),
                ),
                WelcomeBody(controller: controller),
              ],
            ),
          ),
        ),
        // GridGuides()
      ],
    );
  }
}

/// TEST
/*
 Widget _testHtml() {
    return Container(
      color: Colors.black,
      height: Get.height * 0.7,
      width: Get.width,-
      child: Obx(
        () => controller.webServerReady
            ? InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse("http://localhost:8080?aaa=bbb")),
                onWebViewCreated: (controller) {},
                onLoadStart: (controller, url) {},
                onLoadStop: (controller, url) {},
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  Widget _testSpotify() {
    // const html = """
    //   <html>
    //     <head><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
    //     <body>

    //       <iframe style="border-radius:12px" src="https://open.spotify.com/embed/playlist/3mPOxUuncth4ZetwZDussl?utm_source=generator&theme=0" width="100%" height="352" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>
    //     </body>
    //   </html>
    // """;
    final webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent) // Imposto il background trasparente
      ..loadRequest(Uri.parse('https://lines-gioco.tandu.it'));
    // ..loadRequest(Uri.dataFromString(html, mimeType: 'text/html'));

    return Container(
      color: Colors.black,
      height: Get.height * 0.7,
      width: Get.width,
      child: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
  */
