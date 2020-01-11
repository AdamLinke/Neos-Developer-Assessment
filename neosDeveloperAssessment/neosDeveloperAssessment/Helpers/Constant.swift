//
//  Constant.swift
//  neosDeveloperAssessment
//
//  Created by Adam Linke on 11/01/2020.
//  Copyright © 2020 Adam Linke. All rights reserved.
//

import Foundation

struct Constant {
    struct Api {
        static let marvelComicsURL = URL(string: "http://gateway.marvel.com/v1/public/comics")
    }
    struct ImageList {
        static let singleDownloadLimit = 30
    }
}
