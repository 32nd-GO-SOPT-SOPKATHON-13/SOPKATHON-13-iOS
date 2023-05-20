//
//  UIFont+.swift
//  SOPKATON-TEAM13
//
//  Created by KJ on 2023/05/18.
//

import UIKit

extension UIFont {
    static func appleSDGothic(weightOf weight: AppleSDGothicFamily, sizeOf size: AppleSDGothicFontSize) -> UIFont? {
        return UIFont(name: "AppleSDGothicNeo-\(weight.rawValue)", size: size.rawValue)
    }
    
    enum AppleSDGothicFamily: String {
        case Regular, Bold
    }
    
    enum AppleSDGothicFontSize: CGFloat {
        case font12 = 12
        case font13
        case font14
        case font16 = 16
        case font18 = 18
        case font20 = 20
        case font22 = 22
        case font24 = 24
    }
}
