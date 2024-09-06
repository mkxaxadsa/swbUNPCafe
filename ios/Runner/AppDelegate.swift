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
    
    // Integrate ASATools
    ASATools.instance.attribute(apiToken: "8ab22fe0-1efd-4b61-b6de-b0ab05e92b60") { response, error in
      if let response = response {
        // Handle attribution data
        print("ASATools attribution response: \(response)")
        
        // You can add additional handling here, such as sending data to analytics services
        // Example:
        // let analyticsProperties = response.analyticsValues()
        // YourAnalyticsService.logEvent("asa_attribution", properties: analyticsProperties)
      } else if let error = error {
        print("ASATools attribution error: \(error)")
      }
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}