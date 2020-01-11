//
//  ComicViewController.swift
//  neosDeveloperAssessment
//
//  Created by Adam Linke on 10/01/2020.
//  Copyright © 2020 Adam Linke. All rights reserved.
//

import Foundation

struct ComicDataWrapperMC { // MC - Model Controller
    
    func fetchComicDataWrapper(offset: Int = 0, limit: Int = 1, title: String? = nil, completion: @escaping (ComicDataWrapper?) -> Void) {
        var query: [String: String] = [
            "apikey": "3d3ce5daa8ec0f7c17afc52bb68f15f7",
            "hash": "a45bdb0bf57b06e72ad4c2c5854e2843",
            "ts": "1",
            "offset": "\(offset)",
            "limit": "\(limit)",
            ]

        if let title = title {
            query["title"] = String(title)
        }

        guard let url = Constant.Api.marvelComicsURL?.withQueries(query) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()

            if let error = error {
                if let response = response {
                    print("response: \(response)")
                }
                print("error: \(error)")
            } else {

                if let data = data,
                    let comics = try? jsonDecoder.decode(ComicDataWrapper.self, from: data) {
                    completion(comics)
                } else {
                    print("Either no data was returned, or data was not properly decoded.")
                    completion(nil)
                }
            }
        }
        task.resume()
    }
}
