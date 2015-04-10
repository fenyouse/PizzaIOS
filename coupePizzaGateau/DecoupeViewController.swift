//
//  DecoupeViewController.swift
//  coupePizzaGateau
//
//  Created by laurent on 05/02/2015.
//  Copyright (c) 2015 fenyouse. All rights reserved.
//

import UIKit

class DecoupeViewController: UIViewController {
    
    
    
    @IBOutlet weak var ValueMangeur: UITextField!
    
    @IBOutlet weak var StepperMangeur: UIStepper!
    
    
    @IBOutlet weak var Image: UIImageView!
    
    var NomImage:NSString = " "
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"pizza")!)
        
        NomImage = "1"
        NomImage = ValueMangeur.text
        
        Image.image=UIImage(named: NomImage)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func StepperValueChanged(sender: UIStepper) {
        
        ValueMangeur.text = Int(sender.value).description
        NomImage = ValueMangeur.text
        
        Image.image=UIImage(named: NomImage)
        
    }
    
    
    
}

