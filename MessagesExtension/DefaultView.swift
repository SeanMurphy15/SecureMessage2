//
//  DefaultView.swift
//  SecureMessage2
//
//  Created by Sean Murphy on 9/17/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import Foundation
import UIKit

class DefaultView: UIView {

	class func instanceFromNib() -> DefaultView {
		return UINib(nibName: "DefaultView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! DefaultView
	}

}
