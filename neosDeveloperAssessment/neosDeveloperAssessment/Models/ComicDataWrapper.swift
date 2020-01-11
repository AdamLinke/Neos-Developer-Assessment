//
//  ComicDataWrapper.swift
//  neosDeveloperAssessment
//
//  Created by Adam Linke on 10/01/2020.
//  Copyright © 2020 Adam Linke. All rights reserved.
//

struct ComicDataWrapper: Codable {
    let code: Int?
    let status: String?
    let copyright: String?
    let atributionText: String?
    let atributionHTML: String?
    let data: ComicDataContainer?
    let etag: String?

    enum Key: String, CodingKey {
        case code
        case status
        case copyright
        case atributionText
        case atributionHTML
        case data
        case etag
    }

    init (from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: Key.self)
        self.code = try? valueContainer.decode(Int.self, forKey: Key.code)
        self.status = try? valueContainer.decode(String.self, forKey: Key.status)
        self.copyright = try? valueContainer.decode(String.self, forKey: Key.copyright)
        self.atributionText = try? valueContainer.decode(String.self, forKey: Key.atributionText)
        self.atributionHTML = try? valueContainer.decode(String.self, forKey: Key.atributionHTML)
        self.data = try? valueContainer.decode(ComicDataContainer.self, forKey: Key.data)
        self.etag = try? valueContainer.decode(String.self, forKey: Key.etag)
    }
}
