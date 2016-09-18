//
//  MessageView.swift
//  SecureMessage2
//
//  Created by Sean Murphy on 9/17/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import UIKit
import Foundation
import LocalAuthentication

@objc protocol MessageViewDelegate{

	@objc optional func TextViewContent(content: String)
	@objc optional func EnterButtonPressed(bool: Bool)
}

class MessageView: UIView{

	static var sharedInstance = MessageView()

	var delegate : MessageViewDelegate?

	class func instanceFromNib() -> MessageView {
		return UINib(nibName: "MessageView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! MessageView
	}
	@IBOutlet weak var textView: UITextView!
	@IBOutlet weak var enterButton: UIButton!
	@IBOutlet weak var replyButton: UIButton! {
		didSet{
			replyButton.isHidden = true
		}
	}

	@IBAction func enterButtonPressed(_ sender: AnyObject) {
		delegate?.EnterButtonPressed!(bool: true)
		delegate?.TextViewContent!(content: textView.text!)
	}


	@IBAction func replyButtonPressed(_ sender: AnyObject) {

		textView.text = ""
		textView.becomeFirstResponder()
		replyButton.isHidden = true
		enterButton.isHidden = false

	}

	func updateUI(){

		textView.layer.cornerRadius = 10
		textView.layer.borderWidth = 2
		textView.layer.borderColor = UIColor.lightGray.cgColor
		textView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
	}
}
