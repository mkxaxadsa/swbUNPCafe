import ASATools
import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    

    GeneratedPluginRegistrant.register(with: self)
    
    ASATools.instance.attribute(apiToken: "12b3ea9a-3cc7-4d0e-b3a5-82216e5b4e67") { response, error in
        if let error = error {
            print("Error during attribution: \(error.localizedDescription)")
        }
        if let response = response {
            print("Attribution response: \(response)")
            
        }
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}