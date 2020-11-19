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
        let contactsVC = GroupsViewController(dataSource: dataSource, delegate: self)
        contactsVC.title = "Groups"
        contactsVC.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(named: "Groups"), tag: 0)
        navigationController = UINavigationController(rootViewController: contactsVC)
    }
}

extension ShowGroupsFlowCoordinator: GroupsViewControllerDelegate {
    func didSelect(group: Group, in viewController: GroupsViewController) {
      let groupVC = GroupViewController(group: group)
      navigationController.pushViewController(groupVC, animated: true)
    }
}

