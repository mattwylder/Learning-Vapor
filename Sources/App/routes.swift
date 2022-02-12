import Fluent
import Vapor
import Foundation

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    
    app.post("user") { request -> String in
        let decoded = try request.content.decode(UserNumberTwo.self)
        return("Decoded!: \(decoded.name)")
    }
    
    try app.register(collection: SongController())
    try app.register(collection: PersonController())
}


struct UserInfo: Content {
    let name: String
}

struct UserNumberTwo: Content, Codable {
    let name: String
}
