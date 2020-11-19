//
//  SceneDelegate.swift
//  ContactsApp
//
//  Created by Christian Slanzi on 19.11.20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        
        let contacts = [
          Contact(name: "Kelly Goodwin", jobTitle: "Designer", country: "bo"),
          Contact(name: "Mohammad Hussain", jobTitle: "SEO Specialist", country: "be"),
          Contact(name: "John Young", jobTitle: "Interactive Designer", country: "af"),
          Contact(name: "Tamilarasi Mohan", jobTitle: "Architect", country: "al"),
          Contact(name: "Kim Yu", jobTitle: "Economist", country: "br"),
          Contact(name: "Derek Fowler", jobTitle: "Web Strategist", country: "ar"),
          Contact(name: "Shreya Nithin", jobTitle: "Product Designer", country: "az"),
          Contact(name: "Emily Adams", jobTitle: "Editor", country: "bo"),
          Contact(name: "Aabidah Amal", jobTitle: "Creative Director", country: "au")
         ]
        
        window?.rootViewController = UINavigationController(rootViewController: ContactsViewController(contacts: contacts))
        window?.rootViewController?.view.backgroundColor = .yellow  // So we can see it
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

