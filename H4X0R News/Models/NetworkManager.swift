//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Artem Tkachuk on 7/30/20.
//  Copyright © 2020 Artem Tkachuk. All rights reserved.
//

import Foundation
//import Alamofire
//import SwiftyJSON

//Observable protocol means that the object that holds it can broadcast some or all of it properties to all interested parties
class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchData() {
        let baseURL = "http://hn.algolia.com/api/v1/search?tags=front_page"

        if let url = URL(string: baseURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
    
    

