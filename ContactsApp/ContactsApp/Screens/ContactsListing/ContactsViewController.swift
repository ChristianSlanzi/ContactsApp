//
//  ContactsViewController.swift
//  ContactsApp
//
//  Created by Christian Slanzi on 19.11.20.
//

import UIKit

class ContactsViewController: UIViewController {
    
    private var contacts: [Contact] = []
    private let tableView = UITableView()
    
    public init(dataSource: ContactsDataSourceable) {
        self.contacts = dataSource.contacts
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.frame
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: ContactTableViewCell.reuseIdentifier)
    }
}

extension ContactsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedContact = contacts[indexPath.row]
        let contactVC = ContactViewController(contact: selectedContact)
        contactVC.title = selectedContact.name
        navigationController?.pushViewController(contactVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.reuseIdentifier, for: indexPath) as! ContactTableViewCell
        cell.contact = contacts[indexPath.row]
        return cell
    }
}

