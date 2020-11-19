//
//  AppCoordinator.swift
//  ContactsApp
//
//  Created by Christian Slanzi on 19.11.20.
//

import UIKit

class AppCoordinator: FlowCoordinator {
    weak var delegate: FlowCoordinatorDelegate?  // protocol conformance; the AppCoordinator is top-most and does not have a delegate.
    private let window: UIWindow
    
    var rootViewController: UIViewController {
        guard let rootVC = window.rootViewController else {
            fatalError("unable to obtain the window's rootViewController")
        }
        return rootVC
    }
    
    private var contactsDataSource: ContactsDataSourceable!
    private var showContactsFlowCoordinator: ShowContactsFlowCoordinator!
    private var showGroupsFlowCoordinator: ShowGroupsFlowCoordinator!
    
    init(window: UIWindow) {
        self.delegate = nil // emphasize that we do not have a delegate
        self.window = window
        establish()
    }
    
    func start() {
        // Typically a FlowCoordinator will install their first ViewController here, but
        // since this is the app's coordinator, we need to ensure the root/initial UI is
        // established at a prior time.
        //
        // Still, having this here is useful for convention, as well as giving a clear
        // point of instantiation and "starting" the AppCoordinator, even if the implementation
        // is currently empty. Your implementation may have tasks to start.
    }
    
    private func establish() {
        establishLogging()
        loadConfiguration()
        
        contactsDataSource = ContactsDataSource() // shared data resource
        showContactsFlowCoordinator = ShowContactsFlowCoordinator(dataSource: contactsDataSource, delegate: self)
        showContactsFlowCoordinator.start()
        
        showGroupsFlowCoordinator = ShowGroupsFlowCoordinator(dataSource: contactsDataSource, delegate: self)
        showGroupsFlowCoordinator.start()
        
        // abbreviated code, for illustration.
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([showContactsFlowCoordinator.rootViewController,
                                            showGroupsFlowCoordinator.rootViewController], animated: false)
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
    private func establishLogging() {
        //TODO
    }
    
    private func loadConfiguration() {
        //TODO
    }
}
extension AppCoordinator: ShowContactsFlowCoordinatorDelegate { }
extension AppCoordinator: ShowGroupsFlowCoordinatorDelegate { }
