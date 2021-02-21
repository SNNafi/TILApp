//
//  File.swift
//  
//
//  Created by Shahriar Nasim Nafi on 23/1/21.
//

import Fluent

struct CreateAcronym: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("acronyms")
            ///For custom identifier types, you will need to specify the field manually.
            .field("id", .int, .identifier(auto: true))
            .field("short", .string, .required)
            .field("long", .string, .required)
            .create()
    }
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("acronyms").delete()
    }
}
