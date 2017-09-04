//
//  LocationsTableViewController.swift
//  OnTheMapV.2
//
//  Created by Benjamin Odisho on 9/3/17.
//  Copyright © 2017 Benjamin Odisho. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        self.automaticallyAdjustsScrollViewInsets = false
        self.reloadTable()
    }
    
    func reloadTable() {
        ParseClient.sharedInstance().getStudentLocations { success in
            performUIUpdatesOnMain {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        if let rect = self.navigationController?.navigationBar.frame {
            let y = rect.size.height + rect.origin.y
            self.tableView.contentInset = UIEdgeInsetsMake( y, 0, 0, 0)
        }
    }
    // MARK: - TableViewDelegate
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /* Get cell type */
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell") as UITableViewCell!
        let location = StudentLocations.sharedInstance().locations[(indexPath as NSIndexPath).row]
        
        /* Set cell */
        cell?.textLabel!.text = location.firstName + " " + location.lastName
        cell?.detailTextLabel!.text = location.mediaURL
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentLocations.sharedInstance().locations.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let location = StudentLocations.sharedInstance().locations[(indexPath as NSIndexPath).row]
        UIApplication.shared.open(URL(string: location.mediaURL)!)
    }
}
