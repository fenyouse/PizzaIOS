//
//  RecetteViewController.swift
//  coupePizzaGateau
//
//  Created by laurent on 04/02/2015.
//  Copyright (c) 2015 fenyouse. All rights reserved.
//

import UIKit

class RecetteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var Pizzas:[PFObject] = []
    
    let blogSegueIdentifier = "ShowPizzaRecette"
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"pizza")!)

        loadPizza()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   

    
    func loadPizza() {
        
        
        var query = PFQuery(className:"Pizza")
     
        query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
            
            if results != nil {
                for object in results! {
                    self.Pizzas.append(object as! PFObject)
                }
                println(self.Pizzas)
                self.tableView.reloadData()
            }
        }
        
    }
    
    //New
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == blogSegueIdentifier {
            if let destination = segue.destinationViewController as? RecetteDetailsViewController {
                if let PizzaIndex = tableView.indexPathForSelectedRow()?.row {
                    destination.pizza = Pizzas[PizzaIndex]
                 }
            }
        }
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
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        let Pizza = Pizzas[indexPath.row]
        cell.textLabel?.text = Pizza["Name"] as? String
        
        return cell
    }
    
    
    
    
   
}
