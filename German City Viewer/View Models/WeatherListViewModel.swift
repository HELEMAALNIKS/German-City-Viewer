//
//  WeatherListViewModel.swift
//  German City Viewer
//
//  Created by Jaron Hoste on 17/04/2020.
//  Copyright © 2020 Jaron Hoste. All rights reserved.
//

import Foundation

class WeatherListViewModel: ObservableObject {
    var posts = [WeatherViewModel]()
    
    init() {
        
        Webservice().getPosts { posts in
            self.posts = posts
        }
    }
    
}

struct WeatherViewModel {
    var post: Post
    
    init(post: Post) {
        self.post = post
    }
    var title: String {
        return self.post.title
    }
    
    var body: String {
        return self.post.body
    }
}
