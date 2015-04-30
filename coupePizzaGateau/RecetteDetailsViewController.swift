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
    var pizza:PFObject!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"pizza")!)
        
       
        NamePizza.text = pizza["Name"] as? String
        Ingredients = pizza["Recette"] as! [String]
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        let Ingredient = Ingredients[indexPath.row]
        cell.textLabel?.text = Ingredient
        
        return cell
    }
    
   
    
    

    
    
    
    
    
}
