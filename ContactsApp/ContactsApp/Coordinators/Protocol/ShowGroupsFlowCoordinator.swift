//
//  ShowGroupsFlowCoordinator.swift
//  ContactsApp
//
//  Created by Christian Slanzi on 20.11.20.
//

import UIKit

protocol ShowGroupsFlowCoordinatorDelegate: FlowCoordinatorDelegate {
    // nothing, yet.
}

class ShowGroupsFlowCoordinator: FlowCoordinator {
    weak var delegate: ShowGroupsFlowCoordinatorDelegate?
    var rootViewController: UIViewController {
        return navigationController
    }
    private var navigationController: UINavigationController!
    private var dataSource: ContactsDataSourceable!

    init(dataSource: ContactsDataSourceable ,delegate: ShowGroupsFlowCoordinatorDelegate) {
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    func start() {
        let contactsVC = GroupsViewController(contacts: dataSource.contacts, delegate: self)
        contactsVC.title = "Groups"
        contactsVC.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(named: "Groups"), tag: 0)
        navigationController = UINavigationController(rootViewController: contactsVC)
    }
}

extension ShowGroupsFlowCoordinator: ContactsViewControllerDelegate {
    func didSelect(contact: Contact, in viewController: ContactsViewController) {
      let contactVC = ContactViewController(contact: contact)
      navigationController.pushViewController(contactVC, animated: true)
    }
}

