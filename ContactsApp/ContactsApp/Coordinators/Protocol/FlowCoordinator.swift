//
//  FlowCoordinator.swift
//  ContactsApp
//
//  Created by Christian Slanzi on 19.11.20.
//

import UIKit

protocol FlowCoordinatorDelegate: AnyObject { }

protocol FlowCoordinator {
    associatedtype DelegateType
    var delegate: DelegateType? { get set }
    var rootViewController: UIViewController { get }
}
