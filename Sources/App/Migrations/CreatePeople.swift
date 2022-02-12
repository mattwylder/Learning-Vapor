//
//  File.swift
//  
//
//  Created by Matthew Wylder on 2/10/22.
//

import Fluent

struct CreatePeople: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Person.schema)
            .id()
            .field(Person.Keys.firstName, .string, .required)
            .field(Person.Keys.lastName, .string, .required)
            .field(Person.Keys.imageAddress, .string, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Person.schema).delete()
    }
}
