//
//  AnimatorDemoViewController.swift
//  iOS10Demo
//
//  Created by Aydar Mukhametzyanov on 9/14/17.
//  Copyright © 2017 Aydar Mukhametzyanov. All rights reserved.
//

import UIKit

class AnimatorDemoViewController: UIViewController {
    
    private var animator: UIViewPropertyAnimator!
    
    @IBOutlet private weak var animatedView: UIView!
    @IBOutlet private weak var verticalCenterConstraint: NSLayoutConstraint!
    @IBOutlet private weak var horisontalCenterConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIViewPropertyAnimator(duration: 1, curve: .easeInOut, animations: nil)
        
        animator.addAnimations { [weak self] in
            self?.verticalCenterConstraint.constant -= 100
            self?.view.layoutIfNeeded()
        }
        
        animator.addAnimations { [weak self] in
            self?.horisontalCenterConstraint.constant += 100
            self?.view.layoutIfNeeded()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animator.startAnimation()
    }
    
}

