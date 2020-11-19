//
//  ContactDataSourceable.swift
//  ContactsApp
//
//  Created by Christian Slanzi on 19.11.20.
//

protocol ContactsDataSourceable {
    var contacts: [Contact] { get }
    var groups: [Group] { get }
}
