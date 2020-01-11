//
//  ComicsListVC+SearchBar.swift
//  neosDeveloperAssessment
//
//  Created by Adam Linke on 11/01/2020.
//  Copyright © 2020 Adam Linke. All rights reserved.
//

import Foundation
import UIKit

extension ComicsListVC: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
        guard let searchText = searchBar.text  else { return }
        if searchText == "" {
            comicsListVM.currentTitle = nil
        } else {
            comicsListVM.currentTitle = searchText
        }
        comicsListVM.comicsList = []
        comicsListVM.currentOffset = 0
        comicsListVM.downloadComics(with: comicsListVM.currentTitle)
    }
}


