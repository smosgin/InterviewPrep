//
//  File.swift
//  InterviewPrep
//
//  Created by Seth Mosgin on 12/6/18.
//  Copyright © 2018 Seth Mosgin. All rights reserved.
//

import Foundation

struct Xeno: Codable {
    let genericName: String
    let specificName: String
    let englishName: String
    
    enum CodingKeys: String, CodingKey {
        case genericName = "gen"
        case specificName = "sp"
        case englishName = "en"
    }
}
