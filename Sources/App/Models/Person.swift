//
//  Person.swift
//  
//
//  Created by Matthew Wylder on 2/10/22.
//

import Fluent
import Vapor

final class Person: Model, Content {
    
    struct Keys {
        static let firstName = FieldKey.string("firstName")
        static let lastName = FieldKey.string("lastName")
        static let imageAddress = FieldKey.string("imageAddress")
    }
    
    static let schema = "person"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: Keys.firstName)
    var firstName: String
    
    @Field(key: Keys.lastName)
    var lastName: String
    
    @Field(key: Keys.imageAddress)
    var imageAddress: String
    
    init() { }
    
    init(id: UUID? = nil, firstName: String, lastName: String, imageAddress: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.imageAddress = imageAddress
    }
}
