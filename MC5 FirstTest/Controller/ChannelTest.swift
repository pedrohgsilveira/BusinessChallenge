//
//  TableViewController.swift
//  MC5 FirstTest
//
//  Created by Edgar Sgroi on 09/12/19.
//  Copyright © 2019 Pedro Henrique Guedes Silveira. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ChannelTest: UITableViewController {
    
    var channels = [Channel]()
    var context : NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.create_cells()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        create_cells()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelCell", for: indexPath) as? ChannelCellTest {
            cell.lblID.text = String(channels[indexPath.row].id)
            cell.lblName.text = channels[indexPath.row].name
            return cell
        }
        return UITableViewCell()
    }
    
    func create_cells(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Channel")
        request.returnsObjectsAsFaults = false
        if let context = context{
            do{
                let result = try context.fetch(request)
                channels = []
                for data in result as! [NSManagedObject]{
                    channels.append(data as! Channel)
                }
            }catch{
                fatalError("404 - Non Entity")
            }
        }
        tableView.reloadData()
    }
    
}
