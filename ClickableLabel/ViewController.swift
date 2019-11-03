//
//  ViewController.swift
//  ClickableLabel
//
//  Created by Steven Curtis on 30/10/2019.
//  Copyright © 2019 Steven Curtis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gestureLabel: UILabel!
    @IBOutlet weak var gestureTextView: UITextView!
    @IBOutlet weak var attributedTextView: UITextView!
    @IBOutlet weak var attributedLabel: UILabel!
    @IBOutlet weak var interactiveLinkLabel: InteractiveLinkLabel!
    @IBOutlet weak var interactiveLinkTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tap gesture recognizers
        let tapLabel = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapFunction))
        let tapTV = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapFunction))

        // Gesture recognizer Label
        gestureLabel.isUserInteractionEnabled = true
        gestureLabel.addGestureRecognizer(tapLabel)
        gestureLabel.text = "Gesture recognizer label"

        // Gesture recognizer TextView
        gestureTextView.isUserInteractionEnabled = true
        gestureTextView.isEditable = false
        gestureTextView.addGestureRecognizer(tapTV)
        gestureTextView.text = "Gesture recognizer text view"
        
        let plainAttributedString = NSMutableAttributedString(string: "This is a link: ", attributes: nil)
        let string = "A link to Google"
        let attributedLinkString = NSMutableAttributedString(string: string, attributes:[NSAttributedString.Key.link: URL(string: "http://www.google.com")!])
        let fullAttributedString = NSMutableAttributedString()
        fullAttributedString.append(plainAttributedString)
        fullAttributedString.append(attributedLinkString)
        attributedLabel.isUserInteractionEnabled = true
        attributedLabel.attributedText = fullAttributedString
        
        attributedTextView.isUserInteractionEnabled = true
        attributedTextView.isEditable = false
        attributedTextView.attributedText = fullAttributedString
        
        interactiveLinkLabel.attributedText = fullAttributedString
        
        interactiveLinkTextView.isUserInteractionEnabled = true
        interactiveLinkTextView.isEditable = false
        interactiveLinkTextView.attributedText = fullAttributedString
    }
    
    @IBAction func tapFunction(sender: UITapGestureRecognizer) {
        let url = URL(string: "http://www.google.com")!
        UIApplication.shared.open(url)

    }


}

