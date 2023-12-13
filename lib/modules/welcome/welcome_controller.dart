import 'package:get/get.dart';

import '../../core/utils/helpers.dart';
import '../../routes/routes.dart';
import '../../widgets/layouts/app_scaffold_controller.dart';

class WelcomeController extends AppScaffoldController {
  WelcomeController() {
    _startAnimation();
  }

  final RxBool rxStartAnimation = RxBool(false);
  bool get startAnimation => rxStartAnimation.value;
  set startAnimation(bool newValue) => rxStartAnimation.value = newValue;

  final RxBool rxWebServerReady = RxBool(false);
  bool get webServerReady => rxWebServerReady.value;
  set webServerReady(bool newValue) => rxWebServerReady.value = newValue;

  onTapSignin() {
    Get.toNamed(Routes.cookie);
  }

  /// Private methods
  _startAnimation() async {
    await wait(milliseconds: 300);
    startAnimation = true;
  }
}

/*

webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(ThemeColor.background)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.contains('download')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadHtmlString(html);
  late final WebViewController webViewController;
  final String html =
      '<iframe style="border-radius:12px" src="https://open.spotify.com/embed/playlist/5UHHwowSxfcckJgJRpQZgr?utm_source=generator&theme=0" width="100%" height="352" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>';
_startWebServer() async {
    await InAppLocalhostServer(
      directoryIndex: 'prova.html',
      documentRoot: 'assets/web_views',
    ).start();
    webServerReady = true;
  }
*/
