//
//  RegistrationTextField.swift
//  edX
//
//  Created by Muhammad Zeeshan Arif on 14/11/2017.
//  Copyright © 2017 Muhammad Zeeshan Arif. All rights reserved.
//

import UIKit

class RegistrationTextField: UITextField{
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10);
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        self.backgroundColor =  UIColor(patternImage: #imageLiteral(resourceName: "bt_grey_default.png"))
        self.layer.cornerRadius = 4
        self.borderStyle = .none
    }
}

