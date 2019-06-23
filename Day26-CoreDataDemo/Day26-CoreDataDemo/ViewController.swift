//
//  ViewController.swift
//  Day26-CoreDataDemo
//
//  Created by 王林 on 2019/6/23.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UITableViewController {

    var listItems  = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: Selector(("addItem")))
    }


    override func viewDidAppear(_ animated: Bool) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContex = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ListEntity")
        
        do {
            
            let results = try managedContex.fetch(fetchRequest)
            listItems = results as! [NSManagedObject]
            self.tableView.reloadData()
            
        } catch {
            
            print("error")
        }
        
    }
    
   @objc func addItem() {
        
        let alertController = UIAlertController(title: "New Resolution", message: "", preferredStyle: UIAlertController.Style.alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: ({
            (_) in
            
            if let field = alertController.textFields![0] as? UITextField {
                
                self.saveItem(itemToSave: field.text!)
                self.tableView.reloadData()
                
            }
            
        }))
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addTextField (configurationHandler: {
            (textField) in
            
            textField.placeholder = "Type smothing..."
            
        })
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    func saveItem(itemToSave: String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContex = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entity(forEntityName: "ListEntity", in: managedContex)
        let item = NSManagedObject(entity: entity!, insertInto: managedContex)
        
        item.setValue(itemToSave, forKey: "item")
        
        do {
            
            try managedContex.save()
            listItems.append(item)
            
        } catch {
            
            print("error")
            
        }
        
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        
        let item = listItems[indexPath.row]
        
        cell.textLabel?.text = item.value(forKey: "item") as? String
        cell.textLabel?.font = UIFont(name: "", size: 25)
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContex = appDelegate.managedObjectContext
            
            tableView.reloadRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.right)
            managedContex.delete(self.listItems[indexPath.row])
            do {
                try managedContex.save()
                self.listItems.remove(at: indexPath.row)
                self.tableView.reloadData()
            } catch {
                print("error: delete ")
            }
        }
        
        delete.backgroundColor = UIColor.red
        
        return [delete]
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCell.EditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }
}

