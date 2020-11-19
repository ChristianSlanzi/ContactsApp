//
//  GroupsViewController.swift
//  ContactsApp
//
//  Created by Christian Slanzi on 20.11.20.
//

import UIKit

protocol GroupsViewControllerDelegate: AnyObject {
    func didSelect(contact: Contact, in viewController: ContactsViewController)
}

class GroupsViewController: UIViewController {
    
    private var contacts: [Contact] = []
    private weak var delegate: ContactsViewControllerDelegate?
    private let tableView = UITableView()

    public init(contacts: [Contact], delegate: ContactsViewControllerDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
