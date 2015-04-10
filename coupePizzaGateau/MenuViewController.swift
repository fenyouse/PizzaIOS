//
//  MenuViewController.swift
//  coupePizzaGateau
//
//  Created by Fenyouse on 08/04/2015.
//  Copyright (c) 2015 fenyouse. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    
    @IBOutlet weak var BoutonDecoupage: UIImageView!
    @IBOutlet weak var BoutonMap: UIImageView!
    @IBOutlet weak var BoutonRecette: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"pizza")!)
        
        
        BoutonDecoupage.image=UIImage(named: "bouton")
        BoutonMap.image=UIImage(named: "bouton")
        BoutonRecette.image=UIImage(named: "bouton")
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   

    
    
    
}
