//
//  STDAlertView.swift
//  MD Gunasena
//
//  Created by Treinetic-Macbook on 1/28/19.
//  Copyright © 2019 Treinetic PVT LTD. All rights reserved.
//

import UIKit
import SwiftEntryKit

extension MpzAlerts {
    open class STDAlert : MpzAlerts {
        
        @IBOutlet weak var titleLabel: UILabel!
        @IBOutlet weak var messageLabel: UILabel!
        @IBOutlet weak var buttonStack: UIStackView!
        @IBOutlet weak var container: UIView!
        
   
        @IBOutlet weak var containerRightCon: NSLayoutConstraint!
        @IBOutlet weak var containerLeftCon: NSLayoutConstraint!
        
        public override init(frame: CGRect) {
            super.init(frame: frame)
            initializeView()
        }
        
        public required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            initializeView()
        }
        
        override open func initializeView() {
            let nib = UINib(nibName: "STDAlertView", bundle: Bundle.init(for: type(of: self)))
            let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
            self.view = view
        }
        
        public static func show(title : String, message : String, button : String, handler : (() -> ())?) {
            let _ = STDAlert().setTitle(title).setMessage(message).addButton(button, handler: handler).show()
        }
        
        override open func build() {
            buildContainer(view: self.container)
            buildTitleLabel(label: self.titleLabel)
            buildMessageLabel(label: self.messageLabel)
            buttonStack.subviews.forEach({$0.removeFromSuperview()})
            for button in buttons {
                let b = button.getButton()
                buttonStack.addArrangedSubview(b)
            }
        }

    }
}
