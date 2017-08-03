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
        
        // Remove the Navigation Bar Border
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        // 
//        menuContainter.layer.borderColor = UIColor.red.cgColor
//        menuContainter.layer.borderWidth = 1
    }
    
    override func viewDidLayoutSubviews() {
//        menuContainter.layer.sublayers = nil
        // Add rounded corner
        let path = UIBezierPath(roundedRect: menuContainter.bounds, byRoundingCorners: [.topRight], cornerRadii: CGSize(width: 10, height: 10))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        menuContainter.layer.mask = maskLayer
        
        // Add border
        let borderLayer = CAShapeLayer()
        borderLayer.path = maskLayer.path // Reuse the Bezier path
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = UIColor.lightGray.cgColor
        borderLayer.lineWidth = 1
        borderLayer.frame = menuContainter.bounds
        menuContainter.layer.addSublayer(borderLayer)
        
        
        // Add upperborder
        let upperborder = CALayer()
        upperborder.frame = CGRect(x: 0, y: 0, width: menuContainter.frame.width, height: 1)
        upperborder.backgroundColor = UIColor.white.cgColor
        menuContainter.layer.addSublayer(upperborder)
        
        // Add left border
        let leftborder = CALayer()
        leftborder.frame = CGRect(x: 0, y: 0, width: 1, height: menuContainter.frame.height)
        leftborder.backgroundColor = UIColor.white.cgColor
        menuContainter.layer.addSublayer(leftborder)
        
        // Add bottom border
        let bottomborder = CALayer()
        bottomborder.frame = CGRect(x: menuContainter.frame.height-1, y: 0, width: menuContainter.frame.width, height: 1)
        bottomborder.backgroundColor = UIColor.white.cgColor
        menuContainter.layer.addSublayer(bottomborder)
        
        
        
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

