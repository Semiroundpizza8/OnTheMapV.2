//
//  TableViewController.swift
//  OnTheMapV.2
//
//  Created by Benjamin Odisho on 9/3/17.
//  Copyright © 2017 Benjamin Odisho. All rights reserved.
//


import UIKit

class TableViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //------------------------------------------------------------------
    //     Variables/ Setting up Memes
    //------------------------------------------------------------------
    @IBOutlet var tableView: UITableView!

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
    
    // MARK: - TableViewDelegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /* Get cell type */
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell") as UITableViewCell!
        let location = StudentLocations.sharedInstance().locations[(indexPath as NSIndexPath).row]
        
        /* Set cell */
        cell?.textLabel!.text = location.firstName + " " + location.lastName
        
        cell?.imageView!.image = UIImage(named: "icon_pin")
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentLocations.sharedInstance().locations.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let location = StudentLocations.sharedInstance().locations[(indexPath as NSIndexPath).row]
        UIApplication.shared.open(URL(string: location.mediaURL)!)
    }
    
}

