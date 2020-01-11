//
//  ComicDataContainer.swift
//  neosDeveloperAssessment
//
//  Created by Adam Linke on 10/01/2020.
//  Copyright © 2020 Adam Linke. All rights reserved.
//

struct ComicDataContainer: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [Comic]?

    enum Key: String, CodingKey {
        case offset
        case limit
        case total
        case count
        case results
    }

    init (from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: Key.self)
        self.offset = try? valueContainer.decode(Int.self, forKey: Key.offset)
        self.limit = try? valueContainer.decode(Int.self, forKey: Key.limit)
        self.total = try? valueContainer.decode(Int.self, forKey: Key.total)
        self.count = try? valueContainer.decode(Int.self, forKey: Key.count)
        self.results = try? valueContainer.decode([Comic].self, forKey: Key.results)
    }
}
