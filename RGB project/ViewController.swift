//
//  ViewController.swift
//  RGB project
//
//  Created by William H Fulton IV on 6/6/17.
//  Copyright © 2017 IVdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colorSquare: UIView!
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBackgroundColor()
        colorSquare.layer.borderColor = UIColor.black.cgColor
        colorSquare.layer.borderWidth = 1
   
        let defaults = UserDefaults.standard
        redSlider.value = defaults.float(forKey: "redSlider")
        greenSlider.value = defaults.float(forKey: "greenSlider")
        blueSlider.value = defaults.float(forKey: "blueSlider")
    
    }
   
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    
    @IBAction func updateBackgroundColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        colorSquare.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)

        let defaults = UserDefaults.standard
        defaults.set(redSlider.value, forKey: "red")
        defaults.set(greenSlider.value, forKey: "green")
        defaults.set(blueSlider.value, forKey: "blue")
        defaults.synchronize()
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "openColor") {
            let newViewController = segue.destination
            newViewController.view.backgroundColor = colorSquare.backgroundColor
        }
    }
}
