//
//  SpeechSynthesizerDemoViewController.swift
//  iOS10Demo
//
//  Created by Aydar Mukhametzyanov on 9/21/17.
//  Copyright © 2017 Aydar Mukhametzyanov. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class SpeechSynthesizerDemoViewController: UIViewController, DemoViewController {
    
    var model: Demo!
    
    private let speechSynthesizer = AVSpeechSynthesizer()
    private let simpleString = "Presenting stuff in front of a big audience is very exciting"
    private lazy var attributedString: NSAttributedString = {
        let font = UIFont(name: textLabel.font.familyName, size: textLabel.font.pointSize)!
        let boldedFont = UIFont(name: textLabel.font.fontName + "-Bold", size: textLabel.font.pointSize * 2)!
        
        let attributes: [NSAttributedStringKey: Any] = [.font: font]
        
        let string = NSMutableAttributedString(string: simpleString, attributes: attributes)
        if let boldedRange = string.string.range(of: "very exciting") {
            let range = NSMakeRange(boldedRange.lowerBound.encodedOffset,
                                    boldedRange.upperBound.encodedOffset - boldedRange.lowerBound.encodedOffset)
            
            string.addAttribute(.font, value: boldedFont, range: range)
            string.addAttribute(.foregroundColor, value: UIColor.red, range: range)
        }
        
        return string
    }()

    @IBOutlet private weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = model.title
    }
    
    private func synthesizeSpeech() {
        let utterance: AVSpeechUtterance
        
        if let attributedText = textLabel.attributedText {
            utterance = AVSpeechUtterance(attributedString: attributedText)
        } else {
            utterance = AVSpeechUtterance(string: textLabel.text ?? "no text")
        }
        
        speechSynthesizer.speak(utterance)
    }
    
    // MARK: - Actions
    
    @IBAction private func synthesizeSimplePressed(_ sender: Any) {
        textLabel.attributedText = nil
        textLabel.text = simpleString
        synthesizeSpeech()
    }
    
    @IBAction private func synthesizeAttributedPressed(_ sender: Any) {
        textLabel.attributedText = attributedString
        synthesizeSpeech()
    }
}
