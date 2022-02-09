//
//  File.swift
//  
//
//  Created by Matthew Wylder on 2/8/22.
//

import Fluent
import Vapor

struct SongController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let songs = routes.grouped("songs")
        songs.get(use: index)
    }
    
    func index(req: Request) throws -> EventLoopFuture<[Song]> {
        return Song.query(on: req.db).all()
    }
}
