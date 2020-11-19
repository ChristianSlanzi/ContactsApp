//
//  ShowContactsFlowCoordinator.swift
//  ContactsApp
//
//  Created by Christian Slanzi on 19.11.20.
//

import UIKit

protocol ShowContactsFlowCoordinatorDelegate: FlowCoordinatorDelegate {
    // nothing, yet.
}

class ShowContactsFlowCoordinator: FlowCoordinator {
    weak var delegate: ShowContactsFlowCoordinatorDelegate?
    var rootViewController: UIViewController {
        return navigationController
    }
    private var navigationController: UINavigationController!
    private var dataSource: ContactsDataSourceable!
    
    init(dataSource: ContactsDataSourceable ,delegate: ShowContactsFlowCoordinatorDelegate) {
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    func start() {
        let contactsVC = ContactsViewController(dataSource: dataSource, delegate: self)
        contactsVC.title = "Contacts"
        contactsVC.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage(named: "Contacts"), tag: 0)
        
        navigationController = UINavigationController(rootViewController: contactsVC)
        setupNavigation()
    }
    
    private func setupNavigation() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 1, green: 1, blue: 1, alpha: 1)]

    }
}
extension ShowContactsFlowCoordinator: ContactsViewControllerDelegate {
    func didSelect(contact: Contact, in viewController: ContactsViewController) {
        let contactVC = ContactViewController(contact: contact)
        contactVC.title = contact.name
        navigationController.pushViewController(contactVC, animated: true)
    }
}
