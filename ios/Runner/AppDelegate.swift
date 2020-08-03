import UIKit
import Flutter


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    if #available(iOS 10.0, *) {
                registerForPushNotifications()
            } else {
                let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
                application.registerUserNotificationSettings(settings)
                application.registerForRemoteNotifications()
      }

      if #available(iOS 10.0, *) { UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate }


    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  @available(iOS 10.0, *)
      func registerForPushNotifications() {
          UNUserNotificationCenter.current()
              .requestAuthorization(options: [.alert, .sound, .badge]) {
                  [weak self] granted, error in

                  print("Permission granted: \(granted)")
                  guard granted else { return }
                  self?.getNotificationSettings()
          }
      }

      @available(iOS 10.0, *)
      func getNotificationSettings() {
          UNUserNotificationCenter.current().getNotificationSettings { settings in
              print("Notification settings: \(settings)")
              guard settings.authorizationStatus == .authorized else { return }
              DispatchQueue.main.async {
                  UIApplication.shared.registerForRemoteNotifications()
              }
          }
      }
}