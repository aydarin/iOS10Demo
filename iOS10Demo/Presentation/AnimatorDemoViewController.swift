//
//  AnimatorDemoViewController.swift
//  iOS10Demo
//
//  Created by Aydar Mukhametzyanov on 9/14/17.
//  Copyright © 2017 Aydar Mukhametzyanov. All rights reserved.
//

import UIKit

class AnimatorDemoViewController: UIViewController, DemoViewController {
    
    private var animator: UIViewPropertyAnimator!
    var model: Demo!
    
    @IBOutlet private weak var animatedView: UIView!
    @IBOutlet private weak var horisontalCenterConstraint: NSLayoutConstraint!
    @IBOutlet private weak var squareBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = model.title
        
        animator = UIViewPropertyAnimator(duration: 5, curve: .linear, animations: nil)
        
        animator.addAnimations ({ [weak self] in
            self?.squareBottomConstraint.constant += UIScreen.main.bounds.height
            self?.view.layoutIfNeeded()
        }, delayFactor: 0)

        animator.addCompletion { _ in
            print("Animation finished")
        }
    }
    
    // MARK: - Actions
    
    @IBAction func startPressed(_ sender: Any) {
        print("Initial constraint constant: \(squareBottomConstraint.constant)")
        animator.startAnimation()
    }
    
    @IBAction func pausePressed(_ sender: Any) {
        animator.pauseAnimation()
    }
    
    @IBAction func stopPressed(_ sender: Any) {
        animator.stopAnimation(false)
        print("Final constraint constant: \(squareBottomConstraint.constant)")
    }
}

