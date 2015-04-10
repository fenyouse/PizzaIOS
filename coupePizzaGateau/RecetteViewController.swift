//
//  RecetteViewController.swift
//  coupePizzaGateau
//
//  Created by laurent on 04/02/2015.
//  Copyright (c) 2015 fenyouse. All rights reserved.
//

import UIKit

class RecetteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var alertTextField:UITextField?
    
    @IBOutlet weak var tableView: UITableView!
    
    var Pizzas:[String] = []
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"pizza")!)

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "newPizza:")
        self.navigationItem.rightBarButtonItem = addButton
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        loadPizza()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func loadPizza() {
        
        
        var query = PFQuery(className:"Pizza")
     
        query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
            
            for object in results {
                var Pizza = object["Name"] as String
                self.Pizzas.append(Pizza)
            }
            self.tableView.reloadData()
        }
        
    }
    
    
    func newPizza(sender: AnyObject) {
        
        let alert = UIAlertController(title: "New Pizza", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            self.alertTextField = textField
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Add", style: .Default, handler: { (action) -> Void in
            
            
            var Pizza = PFObject(className:"Pizza")
            Pizza["Name"] = self.alertTextField!.text

            
            // Save the object.
            Pizza.saveInBackgroundWithBlock {
                (success: Bool, error: NSError!) -> Void in
                if (success) {
                    // The object has been saved.
                } else {
                    // There was a problem, check error.description
                }
            }
            
            self.loadPizza()
            // recharger fake 
            // self.tableView.reloadData()
            
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
   
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    
    // Return the number of rows in the section.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Pizzas.count
    }
    
    // affectation cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        let Pizza = Pizzas[indexPath.row]
        cell.textLabel?.text = Pizza
        
        return cell
    }
    
    
    // Override to support conditional editing of the table view.
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    
    
    // Override to support editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            
            let Pizza = Pizzas[indexPath.row]
            
           
            Pizzas.removeAtIndex(find(Pizzas, Pizza)!)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }
    }
    
   
}
