//
//  URL+Helpers.swift
//  neosDeveloperAssessment
//
//  Created by Adam Linke on 10/01/2020.
//  Copyright © 2020 Adam Linke. All rights reserved.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.0, value: $0.1)}
        return components?.url
    }
}
