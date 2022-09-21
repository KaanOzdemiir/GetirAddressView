//
//  NibLoadable.swift
//  GetirAddressView
//
//  Created by Kaan Ozdemir on 21.09.2022.
//

import UIKit

protocol NibLoadable {
    static var nibName: String { get }
    func configureViews()
    func updateViews()
}

extension NibLoadable where Self: UIView {
    static var nibName: String {
        String(describing: Self.self)
    }

    static var nib: UINib {
        let bundle = Bundle(for: Self.self)
        return UINib(nibName: Self.nibName, bundle: bundle)
    }

    func setupFromNib() {
        guard let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView else { fatalError("Error loading \(self) from nib") }
        view.backgroundColor = .clear
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func configureViews() { }
    
    func updateViews() { }
}
