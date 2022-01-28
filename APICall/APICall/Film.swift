//
//  Film.swift
//  APICall
//
//  Created by Akash Dandge on 01/07/21.
//

import Foundation


//protocol Displayable {
//  //protocol requirements
//    var titleLabelText: Str {get set}
//}

// MARK: - Todo
struct Todo: Codable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}


struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}


struct Film: Decodable {
    let id: Int
    let title:String
    let opening_crawl:String
    let director:String
    let producer: String
    let releaseDate:String
    let starships:[String]
    
    
}
enum CodingKeys: String,CodingKey{
    case id = "episode_id"
    case title
    case openingCrawl = "opening_crawl"
    case director
    case producer
    case releaseDate = "release_date"
    case starships
}

//
//
//extension Film: Displayable {
//  var titleLabelText: String {
//    title
//  }
//  
//  var subtitleLabelText: String {
//    "Episode \(String(id))"
//  }
//  
//  var item1: (label: String, value: String) {
//    ("DIRECTOR", director)
//  }
//  
//  var item2: (label: String, value: String) {
//    ("PRODUCER", producer)
//  }
//  
//  var item3: (label: String, value: String) {
//    ("RELEASE DATE", releaseDate)
//  }
//  
//  var listTitle: String {
//    "STARSHIPS"
//  }
//  
//  var listItems: [String] {
//    starships
//  }
//}
