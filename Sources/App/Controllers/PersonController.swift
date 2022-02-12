//
//  PersonController.swift
//  
//
//  Created by Matthew Wylder on 2/10/22.
//

import Fluent
import Vapor

struct PersonController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let person = routes.grouped("person")
        person.get(use: index)
        person.post(use: create)
    }
    
    func index(req: Request) throws -> EventLoopFuture<[Person]> {
        return Person.query(on: req.db).all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let person = try req.content.decode(Person.self)
        return person.save(on: req.db).transform(to: .ok)
    }
}
