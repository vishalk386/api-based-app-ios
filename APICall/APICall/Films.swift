//
//  Films.swift
//  APICall
//
//  Created by Akash Dandge on 01/07/21.
//

import Foundation


struct Films: Decodable {
  let count: Int
  let all: [Film]
  
  enum CodingKeys: String, CodingKey {
    case count
    case all = "results"
  }
}
