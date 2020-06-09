//
//  Webservice.swift
//  German City Viewer
//
//  Created by Jaron Hoste on 17/04/2020.
//  Copyright © 2020 Jaron Hoste. All rights reserved.
//

import Foundation

class Webservice {
    
    func getPosts(completion: @escaping ([Weather]?) ->  ()) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                completion(nil)
                return
            }
            
            let posts = try? JSONDecoder().decode([Weather].self, from: data)
            
            DispatchQueue.main.async {
                completion(posts)
            }
            
            completion(posts)
            
        }.resume()
    }
}
