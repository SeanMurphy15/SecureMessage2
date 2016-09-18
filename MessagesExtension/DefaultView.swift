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
	@IBOutlet weak var animationImageView: UIImageView!

	@IBOutlet weak var animationImageView2: UIImageView!
	class func instanceFromNib() -> DefaultView {
		return UINib(nibName: "DefaultView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! DefaultView
	}

	func animateScan(){



		UIView.animate(withDuration: 4.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveLinear, animations: {
			self.animationImageView.center.x -= 200
			self.animationImageView2.center.x += 200

		}) { (finished) in

			UIView.animate(withDuration: 4.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveLinear, animations: {
				self.animationImageView.center.x += 200
				self.animationImageView2.center.x -= 200


			}) { (finished) in
				self.animateScan()
			}
		}
	}
}
