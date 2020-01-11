//
//  ComicDetailsVC.swift
//  neosDeveloperAssessment
//
//  Created by Adam Linke on 11/01/2020.
//  Copyright © 2020 Adam Linke. All rights reserved.
//

import UIKit
import Kingfisher

class ComicDetailsVC: UIViewController {

    @IBOutlet weak var comicTitleLabel: UILabel!
    @IBOutlet weak var comicImageView: UIImageView!
    @IBOutlet weak var comicDescription: UILabel!
    @IBOutlet weak var pageCountLabel: UILabel!

    var comicDetailsVM = ComicDetailsVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        comicTitleLabel.text = comicDetailsVM.comic?.title
        comicDescription.text = comicDetailsVM.comic?.description


        let url = comicDetailsVM.comic?.returnThumbnailFullURLpath(size: .fantastic)
        comicImageView.kf.indicatorType = .activity
        comicImageView.kf.setImage(with: url)

        guard let pageCount = comicDetailsVM.comic?.pageCount else { return }
        pageCountLabel.text = "page count: " + String(pageCount)
    }
}
