//
//  PostData.swift
//  H4X0R News
//
//  Created by Artem Tkachuk on 7/30/20.
//  Copyright © 2020 Artem Tkachuk. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    let title: String
    let points: Int
    let url: String?
    let objectID: String
    
    var id: String {
        return objectID
    }
}
