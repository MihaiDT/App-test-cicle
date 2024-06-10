import UIKit
import Flutter

import BrazeKit
import braze_plugin

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
  static var braze: Braze? = nil
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

#if targetEnvironment(simulator)
#else
    // Setup Braze
    let configuration = Braze.Configuration(
      apiKey: "b543a929-5eb9-41f1-952d-fb2d13470d0c",
      endpoint: "sdk.fra-02.braze.eu"
    )
    // - Enable logging or customize configuration here
    configuration.logger.level = .info

    let braze = BrazePlugin.initBraze(configuration)
    AppDelegate.braze = braze
#endif

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
