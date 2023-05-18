//
//  UIStackView+.swift
//  SOPKATON-TEAM13
//
//  Created by KJ on 2023/05/18.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {  self.addArrangedSubview($0) }
    }
}
