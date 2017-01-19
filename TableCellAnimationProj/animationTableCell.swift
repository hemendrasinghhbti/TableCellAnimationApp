//
//  animationTableCell.swift
//  TableCellAnimationProj
//
//  Created by HemendraSingh on 10/10/16.
//  Copyright © 2016 Kloudrac s/w. All rights reserved.
//

import UIKit

class animationTableCell: UITableViewCell {
    
    @IBOutlet weak var leftUIView: UIView!
    @IBOutlet weak var centerUIView: UIView!
    @IBOutlet weak var rightUIView: UIView!
    @IBOutlet weak var feedbackLeftUIView: UIView!
    @IBOutlet weak var feedbackCenterUIView: UIView!
    @IBOutlet weak var feedbackRightUIView: UIView!
    @IBOutlet weak var leftViewMargin: NSLayoutConstraint!
    @IBOutlet weak var rightViewMargin: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            if self.tag == 0 {
            self.makePlainUIViewToCircle()
            }
            else {
                self.makePlainUIViewToCircleOfFeedback()
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func makePlainUIViewToCircle() {
        leftUIView.layer.cornerRadius = leftUIView.frame.size.width/2.0
        leftUIView.clipsToBounds = true
        leftUIView.layer.borderColor = UIColor.white.cgColor
        leftUIView.layer.borderWidth = 1.0
        centerUIView.layer.cornerRadius = centerUIView.frame.size.width/2.0
        centerUIView.clipsToBounds = true
        rightUIView.layer.cornerRadius = rightUIView.frame.size.width/2.0
        rightUIView.clipsToBounds = true
    }
    
    func makePlainUIViewToCircleOfFeedback() {
        feedbackLeftUIView.layer.cornerRadius = feedbackLeftUIView.frame.size.width/2.0
        feedbackLeftUIView.clipsToBounds = true
        feedbackCenterUIView.layer.cornerRadius = feedbackCenterUIView.frame.size.width/2.0
        feedbackCenterUIView.clipsToBounds = true
        feedbackRightUIView.layer.cornerRadius = feedbackRightUIView.frame.size.width/2.0
        feedbackRightUIView.clipsToBounds = true
    }
}

