//
//  ContactsDataSource.swift
//  ContactsApp
//
//  Created by Christian Slanzi on 19.11.20.
//

class ContactsDataSource: ContactsDataSourceable {
    
    //TODO: here we get our contacts from a stub repository. We could create a data seervice layer.
    // get data from a local db, update from network, etc... combine the two service use a caching fallback.
    internal let contacts = ContactAPI.getContacts()
}
