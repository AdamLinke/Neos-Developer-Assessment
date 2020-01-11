//
//  MainViewController+DataSource.swift
//  neosDeveloperAssessment
//
//  Created by Adam Linke on 09/01/2020.
//  Copyright © 2020 Adam Linke. All rights reserved.
//

import UIKit

extension ComicsListVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comicsListVM.comicsList.count
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == comicsListVM.comicsList.count - Constant.ImageList.singleDownloadLimit / 2 {
            comicsListVM.downloadComics(with: comicsListVM.currentTitle)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "comicTableViewCell", for: indexPath) as? ComicsListTableViewCell else { return UITableViewCell() }

        if comicsListVM.comicsList.count >= indexPath.row {
            let comic = comicsListVM.comicsList[indexPath.row]
            cell.update(with: comic)
        }

        return cell
    }
}
