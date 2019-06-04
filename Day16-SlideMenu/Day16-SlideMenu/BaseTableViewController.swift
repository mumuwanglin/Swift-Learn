//
//  BaseTableViewController.swift
//  Day16-SlideMenu
//
//  Created by 王林 on 2019/6/4.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }

}
