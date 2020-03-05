//
//  NewsViewController.swift
//  NewsTakeHome
//
//  Created by Ramon Geronimo on 1/27/20.
//  Copyright © 2020 Ramon Geronimo. All rights reserved.
//

import Foundation
import UIKit

class NewsViewController: UIViewController {
    
    var name = ""
    var content = ""
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.text = "Working"
        textView.isUserInteractionEnabled = false
        let largeTextString = "Here is some large, bold text"
        
        let attrText = NSMutableAttributedString(string: largeTextString)

        let largeFont = UIFont(name: "Arial-BoldMT", size: 30.0)!
        

        //  Convert textString to NSString because attrText.addAttribute takes an NSRange.
        let largeTextRange = (largeTextString as NSString).range(of: largeTextString)
        

        attrText.addAttribute(NSAttributedString.Key.font, value: largeFont, range: largeTextRange)
        

        textView.attributedText = attrText
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = name
        self.navigationItem.largeTitleDisplayMode = .never
        self.view.addSubview(textView)
        textView.text = content
        textView.fillSuperview()
        
    }
}
