//
//  CardsViewController.swift
//  Tinder
//
//  Created by Thomas Zhu on 4/5/17.
//  Copyright © 2017 Thomas Zhu. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var cardImageView: UIImageView!

    private var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardInitialCenter = cardImageView.center
    }

    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        if (sender.state == .began) {
            // Do nothing
            
        } else if (sender.state == .changed) {
            
            let translation = sender.translation(in: view)
            cardImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
            
        } else if (sender.state == .ended) {
            UIView.animate(
                withDuration: 0.5,
                animations: {
                    let velocityX = sender.velocity(in: self.cardImageView).x
                    if (velocityX > 0) {
                        print("right")
                    } else if (velocityX < 0) {
                        print("left")
                    }
                },
                completion: nil)
            
        }
    }
}
