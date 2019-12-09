//
//  ViewController.swift
//  MC5 FirstTest
//
//  Created by Pedro Henrique Guedes Silveira on 06/12/19.
//  Copyright © 2019 Pedro Henrique Guedes Silveira. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var channels = [Channel]()
    var context : NSManagedObjectContext?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if UserDefaults().bool(forKey: "first_open") == true{
            firstSetup()
        } else {
            print("aaaaa")
            firstSetup()
        }
        tableView.delegate = self
        tableView.dataSource = self
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        self.create_cells()
    }
    
    func firstSetup() {
        UserDefaults().set(false, forKey: "first_open")
        APIRequests.getRequest(url: "https://noodleness.herokuapp.com/api/channels", decodableType: [ChannelsInfo].self) { (res) in
            switch res {
                case .result(let result as [ChannelsInfo]):
                    if result.isEmpty {
                        fatalError("Channels Array Not Founded")
                        
                    } else {
                        for r in result {
                            _ = CoreDataManager.shared().addChannel(id: Int32(r.id!), name: r.name!)
                        }
                    }
                break
                case .error(let error):
                    fatalError(error.localizedDescription)
                default:
                    fatalError("Channels Not Founded")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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

