//
//  ComicsListVC+VMDeletage.swift
//  neosDeveloperAssessment
//
//  Created by Adam Linke on 11/01/2020.
//  Copyright © 2020 Adam Linke. All rights reserved.
//

import Foundation

extension ComicsListVC: ComicsListVMDelegate {
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
