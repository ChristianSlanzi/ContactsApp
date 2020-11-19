//
//  GroupViewController.swift
//  ContactsApp
//
//  Created by Christian Slanzi on 20.11.20.
//

import UIKit

class GroupViewController: UIViewController {
    
    private var group: Group!
    // Imagine it has functionality to display the Group in detail.
    
    let nameView = UITextView()
    
    public init(group: Group) {
        super.init(nibName: nil, bundle: nil)
        self.group = group
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        nameView.text = group?.name
        nameView.textColor = .black
        nameView.font = .boldSystemFont(ofSize: 32)
        nameView.textAlignment = .center
        
        view.addSubview(nameView)
        
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.center = view.center
        nameView.frame = CGRect(origin: CGPoint(x: 0, y: view.center.y), size: CGSize(width: view.frame.width, height: 60))
    }
}
