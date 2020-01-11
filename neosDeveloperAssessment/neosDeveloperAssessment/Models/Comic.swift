//
//  Comic.swift
//  neosDeveloperAssessment
//
//  Created by Adam Linke on 10/01/2020.
//  Copyright © 2020 Adam Linke. All rights reserved.
//

import Foundation

struct Comic: Codable {
    let id: Int?
    let digitalId: Int?
    let title: String?
    let issueNumber: Int?
    let description: String?
    let format: String?
    let pageCount: Int?
    let thumbnail: Image?

    struct Image: Codable {
        let path: String?
        let fileExtension: String?
        
        enum Key: String, CodingKey {
            case path
            case fileExtension = "extension"
        }
        init (from decoder: Decoder) throws {
            let valueContainer = try decoder.container(keyedBy: Key.self)
            self.path = try? valueContainer.decode(String.self, forKey: Key.path)
            self.fileExtension = try? valueContainer.decode(String.self, forKey: Key.fileExtension)
        }
    }

    enum Key: String, CodingKey {
        case id
        case digitalId
        case title
        case issueNumber
        case description
        case format
        case pageCount
        case thumbnail
    }

    init (from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: Key.self)
        self.id = try? valueContainer.decode(Int.self, forKey: Key.id)
        self.digitalId = try? valueContainer.decode(Int.self, forKey: Key.digitalId)
        self.title = try? valueContainer.decode(String.self, forKey: Key.title)
        self.issueNumber = try? valueContainer.decode(Int.self, forKey: Key.issueNumber)
        self.description = try? valueContainer.decode(String.self, forKey: Key.description)
        self.format = try? valueContainer.decode(String.self, forKey: Key.format)
        self.pageCount = try? valueContainer.decode(Int.self, forKey: Key.pageCount)
        self.thumbnail = try? valueContainer.decode(Image.self, forKey: Key.thumbnail)
    }

    enum ThumbnailPortraitSizes: String {
        case small = "portrait_small"
        case medium = "portrait_medium"
        case xlarge = "portrait_xlarge"
        case fantastic = "portrait_fantastic"
        case uncanny = "portrait_uncanny"
        case incredible = "portrait_incredible"
    }

    func returnThumbnailFullURLpath(size: ThumbnailPortraitSizes) -> URL? {
        if let path = self.thumbnail?.path,
            let fileExtension = self.thumbnail?.fileExtension {
            let urlString = path + "/" + size.rawValue + "." + fileExtension
            let url = URL(string: urlString)

            return url
        }
        return nil
    }
}
