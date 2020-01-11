//
//  ComicsListTableViewCell.swift
//  neosDeveloperAssessment
//
//  Created by Adam Linke on 10/01/2020.
//  Copyright © 2020 Adam Linke. All rights reserved.
//

import UIKit
import Kingfisher

class ComicsListTableViewCell: UITableViewCell {
    @IBOutlet weak var comicThumbnailImage: UIImageView!
    @IBOutlet weak var comicTitle: UILabel!
    @IBOutlet weak var comicDescription: UILabel!

    func update(with comic: Comic) {
        comicTitle.text = comic.title
        comicDescription.text = comic.description
        if let url = comic.returnThumbnailFullURLpath(size: .medium) {
            comicThumbnailImage.kf.setImage(with: url)
        }
    }
}
