//
//  GAddressView.swift
//  GetirAddressView
//
//  Created by Kaan Ozdemir on 21.09.2022.
//

import UIKit

class GAddressView: UIView {
    
    @IBOutlet weak var tvsViewWidth: NSLayoutConstraint!
    @IBOutlet weak var tvsView: UIView!
    @IBOutlet weak var tvsContainer: UIStackView!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var addressViewTrailing: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    init() {
        super.init(frame: .zero)
        setupFromNib()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFromNib()
        configureViews()
    }
    
    internal func configureViews() {
        backgroundColor = .clear
        addressView.layer.cornerRadius = 0
        addressView.layer.masksToBounds = true
        tvsViewWidth.constant = 0
        tvsContainer.alpha = 0
        addressViewTrailing.constant = 46
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.updateViews()
        }
        
    }
    
    func updateViews() {
        tvsViewWidth.constant = 120
        addressViewTrailing.constant = 16
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseIn) {
            self.addressView.layer.cornerRadius = 28
            self.layoutIfNeeded()
        } completion: { finished in
            if finished {
                UIView.animate(withDuration: 0.3) {
                    self.tvsContainer.alpha = 1
                }
            }
        }

    }
}

extension GAddressView: NibLoadable { }
