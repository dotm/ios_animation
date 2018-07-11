//
//  ViewController.swift
//  animation
//
//  Created by Yoshua Elmaryono on 11/07/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var square: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tapObject = UITapGestureRecognizer(target: self, action: #selector(changeColor))
        square.addGestureRecognizer(tapObject)
        
        let swipeObject = UISwipeGestureRecognizer(target: self, action: #selector(moveSquare))
        swipeObject.direction = .down
        square.addGestureRecognizer(swipeObject)
    }
    
    func getRandomPosition() -> CGRect {
        let width = 100
        let height = 100
        let safeX = view.safeAreaInsets.left
        let safeY = view.safeAreaInsets.top
        let maxX = view.frame.maxX - CGFloat(safeX)
        let maxY = view.frame.maxY - CGFloat(safeY)
        
        let x = arc4random_uniform(UInt32(maxX) - UInt32(width) - UInt32(safeX)) + UInt32(safeX)
        let y = arc4random_uniform(UInt32(maxY) - UInt32(height) - UInt32(safeY)) + UInt32(safeY)
        
        return CGRect(x: Int(x), y: Int(y), width: width, height: height)
    }
    @objc func moveSquare(){
        UIView.animate(withDuration: 0.5) {
            self.square.frame = self.getRandomPosition()
        }
    }
    
    func getRandomColor() -> UIColor {
        let red = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let green = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let blue = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    @objc func changeColor(){
        UIView.animate(withDuration: 0.5) {
            self.square.backgroundColor = self.getRandomColor()
        }
    }

}

