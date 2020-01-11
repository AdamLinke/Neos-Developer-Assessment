//
//  ViewController.swift
//  neosDeveloperAssessment
//
//  Created by Adam Linke on 09/01/2020.
//  Copyright © 2020 Adam Linke. All rights reserved.
//

import UIKit

final class ComicsListVC: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    let comicsListVM = ComicsListVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        comicsListVM.delegate = self

        comicsListVM.downloadComics(with: nil)

        tableView.keyboardDismissMode = .onDrag
        tableView.showsVerticalScrollIndicator = false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            if segue.identifier == "showComicDetail" {
                let comicDetailVC = segue.destination as? ComicDetailsVC
                let comic = comicsListVM.comicsList[indexPath.row]
                comicDetailVC?.comicDetailsVM.comic = comic
            }
        }
    }
}

