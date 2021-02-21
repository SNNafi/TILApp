//
//  File.swift
//  
//
//  Created by Shahriar Nasim Nafi on 23/1/21.
//

import Vapor
import Fluent

final class Acronym: Model {
   
    
    
    static let schema = "acronyms"
    
    //    @ID
    //    var id: UUID?
    //
    /// This is compatible with SQL databases using auto-incrementing primary keys, but is not compatible with NoSQL.
    ///
    /// Custom @IDs allow the user to specify how the identifier should be generated using the generatedBy parameter
    ///
    ///The generatedBy parameter supports these cases:
    ///
    ///    .user ->    @ID property is expected to be set before saving a new model.
    ///
    ///   .random ->    @ID value type must conform to RandomGeneratable.
    ///
    ///    .database ->   Database is expected to generate a value upon save.
    ///
    ///If the generatedBy parameter is omitted, Fluent will attempt to infer an appropriate case based on the @ID value type. For example, Int will default to .database generation unless otherwise specified
    @ID(custom: "id")
    var id: Int?
    
    @Field(key: "short")
    var short: String
    
    @Field(key: "long")
    var long: String
    
    init() { }
    
    init(id: Int? = nil, short: String, long: String) {
        self.id = id
        self.short = short
        self.long = long
    }
}

extension Acronym: Content { }
