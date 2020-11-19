//
//  ContactViewController.swift
//  ContactsApp
//
//  Created by Christian Slanzi on 19.11.20.
//

import UIKit

/// Shows a single Contact in detail.
class ContactViewController: UIViewController {
    private var contact: Contact!
    // Imagine it has functionality to display the Contact in detail.
    
    let nameView = UITextView()
    
    public init(contact: Contact) {
        super.init(nibName: nil, bundle: nil)
        self.contact = contact
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        nameView.text = contact?.name
        nameView.textColor = .black
        nameView.font = .boldSystemFont(ofSize: 32)
        nameView.textAlignment = .center
        
        view.addSubview(nameView)
        
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.center = view.center
        nameView.frame = CGRect(origin: CGPoint(x: 0, y: view.center.y), size: CGSize(width: view.frame.width, height: 60))
    }
}
