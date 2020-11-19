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
    
    public init(contacts: [Contact]) {
        self.contacts = contacts
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.frame
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = contacts[indexPath.row].name
        return cell
    }
}

