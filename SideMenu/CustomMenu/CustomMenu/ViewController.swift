//
//  ViewController.swift
//  CustomMenu
//
//  Created by Alexander Lesin on 8/2/17.
//  Copyright © 2017 Alexander Lesin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftLeading: NSLayoutConstraint!
    @IBOutlet weak var menuContainter: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        leftLeading.constant = -self.view.frame.width*0.6
//        self.view.layoutIfNeeded()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showMenu(_ sender: UIBarButtonItem) {
        if (leftLeading.constant != 0 )
        {
            leftLeading.constant = 0
            UIView.animate(withDuration: 0.5, animations: {self.view.layoutIfNeeded()})
        } else {
            leftLeading.constant = -menuContainter.frame.width
            UIView.animate(withDuration: 0.5, animations: {self.view.layoutIfNeeded()})
        }
    }
}

