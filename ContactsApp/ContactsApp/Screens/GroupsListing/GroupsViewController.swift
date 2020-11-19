//
//  GroupsViewController.swift
//  ContactsApp
//
//  Created by Christian Slanzi on 20.11.20.
//

import UIKit

protocol GroupsViewControllerDelegate: AnyObject {
    func didSelect(group: Group, in viewController: GroupsViewController)
}

class GroupsViewController: UIViewController {
    
    private var groups: [Group] = []
    private weak var delegate: GroupsViewControllerDelegate?
    private let tableView = UITableView()

    public init(dataSource: ContactsDataSourceable, delegate: GroupsViewControllerDelegate?) {
        self.groups = dataSource.groups
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.frame
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension GroupsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedGroup = groups[indexPath.row]
        delegate?.didSelect(group: selectedGroup, in: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension GroupsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = groups[indexPath.row].name
        return cell
    }
}
