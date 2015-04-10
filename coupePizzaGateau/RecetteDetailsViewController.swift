//
//  RecetteDetailsViewController.swift
//  coupePizzaGateau
//
//  Created by Fenyouse on 08/04/2015.
//  Copyright (c) 2015 fenyouse. All rights reserved.
//

import UIKit

class RecetteDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var NamePizza: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var Ingredients:[String] = []
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"pizza")!)
            
            
        LoadIngredients()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func LoadIngredients(){
        
        var query = PFQuery(className:"Pizza")
        
        query.getObjectInBackgroundWithId("9hs7ycu3uf") {
            (Object: PFObject!, error: NSError!) -> Void in
            if error == nil && Object != nil {
                
               
                var Name = Object["Name"] as String
                self.NamePizza.text = Name
                
                
                self.Ingredients = Object["Recette"] as Array
                
                
                var test = self.Ingredients[2]
                println(test)
                
                
                
            } else {
                println(error)
            }
        }
        
        self.tableView.reloadData()
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    // Return the number of rows in the section.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return Ingredients.count
    }
    
    // affectation cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        let Ingredient = Ingredients[indexPath.row]
        cell.textLabel?.text = Ingredient
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }

    
    
    
    
    
}
