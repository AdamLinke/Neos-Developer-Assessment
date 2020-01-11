//
//  ComicsListVM.swift
//  neosDeveloperAssessment
//
//  Created by Adam Linke on 10/01/2020.
//  Copyright © 2020 Adam Linke. All rights reserved.
//

import Foundation

protocol ComicsListVMDelegate {
    func reloadTableView()
}

final class ComicsListVM {
    var comicsList: [Comic] = []
    var currentOffset = 0
    var delegate: ComicsListVMDelegate?
    var currentTitle: String? = nil

    init() {}

    func downloadComics(with title: String?) {
        let comicDataWrapperMC = ComicDataWrapperMC()
        comicDataWrapperMC.fetchComicDataWrapper(offset: currentOffset,
                                                 limit: Constant.ImageList.singleDownloadLimit,
                                                 title: title)
        { (comicDataWrapper) in
            guard let comics = comicDataWrapper?.data?.results else { return }
            self.comicsList += comics
            self.currentOffset += Constant.ImageList.singleDownloadLimit
            self.delegate?.reloadTableView()
        }
    }
}
