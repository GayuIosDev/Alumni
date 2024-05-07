//
//  AppDelegate.swift
//  VsAlumni
//
//  Created by admin on 11/10/23.
//

import UIKit
import FirebaseCore
import FirebaseMessaging
import AWSCore
import FirebaseCrashlytics

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {

    var deviceTok : String!

        var window: UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

            

            FirebaseApp.configure()

            Crashlytics.crashlytics().setCrashlyticsCollectionEnabled(true)

            initializeS3()

            if #available(iOS 10.0, *) {

                        // For iOS 10 display notification (sent via APNS)

                        UNUserNotificationCenter.current().delegate = self

            

                        let authOptions: UNAuthorizationOptions = [.alert, .badge,.sound]

                        UNUserNotificationCenter.current().requestAuthorization(

                            options: authOptions,

                            completionHandler: {_, _ in })

                    } else {

                        let settings: UIUserNotificationSettings =

                        UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)

                        application.registerUserNotificationSettings(settings)

                    }

                    application.registerForRemoteNotifications()

                    Messaging.messaging().delegate = self

            return true

        }



        // MARK: UISceneSession Lifecycle



        func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

            

            return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)

        }



        func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

            

        }



        

        func initializeS3() {

               let poolId = "ap-south-1:5358f3d7-ec74-4bf5-8b69-df26a06ebd6a" // 3-1

               let credentialsProvider = AWSCognitoCredentialsProvider(regionType: .APSouth1, identityPoolId: poolId)//3-2

               let configuration = AWSServiceConfiguration(region: .APSouth1, credentialsProvider: credentialsProvider)

               AWSServiceManager.default().defaultServiceConfiguration = configuration

               

               

           }



        func application(_ application: UIApplication,

                         didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

            Messaging.messaging().apnsToken = deviceToken

    //        deviceTok = deviceToken

            

        }





        func userNotificationCenter(_ center: UNUserNotificationCenter,

                                      willPresent notification: UNNotification) async

            -> UNNotificationPresentationOptions {

            let userInfo = notification.request.content.userInfo



            // With swizzling disabled you must let Messaging know about the message, for Analytics

            // Messaging.messaging().appDidReceiveMessage(userInfo)



            // ...



            // Print full message.

            print(userInfo)



            // Change this to your preferred presentation option

            return [[.alert, .sound]]

          }



          func userNotificationCenter(_ center: UNUserNotificationCenter,

                                      didReceive response: UNNotificationResponse) async {

            let userInfo = response.notification.request.content.userInfo



            // ...



            // With swizzling disabled you must let Messaging know about the message, for Analytics

            // Messaging.messaging().appDidReceiveMessage(userInfo)



            // Print full message.

            print(userInfo)

          }



            func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {

              print("Firebase registration token: \(String(describing: fcmToken))")



              let dataDict: [String: String] = ["token": fcmToken ?? ""]

              NotificationCenter.default.post(

                name: Notification.Name("FCMToken"),

                object: nil,

                userInfo: dataDict

              )

              // TODO: If necessary send token to application server.

              // Note: This callback is fired at each app startup and whenever a new token is generated.

            }





        func application(_ application: UIApplication,

                             didReceiveRemoteNotification userInfo: [AnyHashable: Any]) async

              -> UIBackgroundFetchResult {

              // If you are receiving a notification message while your app is in the background,

              // this callback will not be fired till the user taps on the notification launching the application.

              // TODO: Handle data of notification



              // With swizzling disabled you must let Messaging know about the message, for Analytics

              // Messaging.messaging().appDidReceiveMessage(userInfo)



              // Print message ID.

             

              // Print full message.

              print(userInfo)



              return UIBackgroundFetchResult.newData

            }





        }



    //MARK: -  UNUserNotificationCenterDelegate



    @available(iOS 10, *)



        func userNotificationCenter(_ center: UNUserNotificationCenter,

                                    didReceive response: UNNotificationResponse,

                                    withCompletionHandler completionHandler: @escaping () -> Void) {

            completionHandler()

        }

        

      func userNotificationCenter(_ center: UNUserNotificationCenter,

                                  willPresent notification: UNNotification,

        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {

        NotificationCenter.default.post(name: Notification.Name.didReceiveNotification, object: nil)

        let userInfo = notification.request.content.userInfo

        print("will Present")

        print(userInfo)

    //    if let messageID = userInfo[gcmMessageIDKey] {

    //      print("Message ID: \(messageID)")

    //    }

        completionHandler([[.alert, .sound]])

      }

