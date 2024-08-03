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
  do {
    // Setup Braze
    let configuration = Braze.Configuration(
      apiKey: "dd098a1b-2f31-4704-858b-54f7b8fd2457",
      endpoint: "sdk.fra-02.braze.eu"
    )
    // - Enable logging or customize configuration here
    configuration.logger.level = .info

    let braze = BrazePlugin.initBraze(configuration)
    AppDelegate.braze = braze
  } 
  catch {
  }
#endif

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
