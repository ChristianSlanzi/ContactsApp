//
//  ContactAPI.swift
//  ContactsApp
//
//  Created by Christian Slanzi on 19.11.20.
//

class ContactAPI {
    
    static func getContacts() -> [Contact]{
        let contacts = [
            Contact(name: "Kelly Goodwin", jobTitle: "Designer", country: "bo"),
            Contact(name: "Mohammad Hussain", jobTitle: "SEO Specialist", country: "be"),
            Contact(name: "John Young", jobTitle: "Interactive Designer", country: "af"),
            Contact(name: "Tamilarasi Mohan", jobTitle: "Architect", country: "al"),
            Contact(name: "Kim Yu", jobTitle: "Economist", country: "br"),
            Contact(name: "Derek Fowler", jobTitle: "Web Strategist", country: "ar"),
            Contact(name: "Shreya Nithin", jobTitle: "Product Designer", country: "az"),
            Contact(name: "Emily Adams", jobTitle: "Editor", country: "bo"),
            Contact(name: "Aabidah Amal", jobTitle: "Creative Director", country: "au")
        ]
        return contacts
    }
    
    static func getGroups() -> [Group] {
        let groups = [
            Group(name: "Friends",
                  contacts: [
                    Contact(name: "Kim Yu", jobTitle: "Economist", country: "br"),
                    Contact(name: "Derek Fowler", jobTitle: "Web Strategist", country: "ar"),
                    Contact(name: "Shreya Nithin", jobTitle: "Product Designer", country: "az")
                  ]),
            Group(name: "Colleagues",
                  contacts: [
                    Contact(name: "Mohammad Hussain", jobTitle: "SEO Specialist", country: "be"),
                    Contact(name: "John Young", jobTitle: "Interactive Designer", country: "af")
                  ]),
        ]
        return groups
    }
}
