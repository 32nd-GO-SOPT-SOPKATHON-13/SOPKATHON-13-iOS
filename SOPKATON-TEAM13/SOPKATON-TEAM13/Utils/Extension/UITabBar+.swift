//
//  UITabBar+.swift
//  SOPKATON-TEAM13
//
//  Created by KJ on 2023/05/18.
//

import UIKit

extension UITabBar {
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}
