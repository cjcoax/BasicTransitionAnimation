//
//  CircleView.swift
//  PlayButtonAnimation
//
//  Created by Amir Rezvani on 4/11/15.
//  Copyright (c) 2015 cjcoaxapps. All rights reserved.
//

import UIKit
class CircleView : UIView {
//    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var lblText: UILabel!

    
    

    
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
    }
    
    
    func setLabel(text:String) {
        lblText.text = text
        
        
    }
    
    
    
}
