//
//  InnerButtonView.swift
//  SOPKATON-TEAM13
//
//  Created by KYUBO A. SHIM on 2023/05/21.
//

import UIKit

import SnapKit
import Then

final class InnerButtonView: UIView {
    
    lazy var innerShadowLayer: CAShapeLayer = {
        let shadowLayer = CAShapeLayer()
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        shadowLayer.shadowOpacity = 0.2
        shadowLayer.shadowRadius = 14
        shadowLayer.fillRule = .evenOdd
        return shadowLayer
    }()
    
    private let innerShadowView = UIView()
    let innerButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.width / 2
        self.innerButton.layer.cornerRadius = self.innerButton.frame.width / 2
        
        self.innerShadowView.layer.cornerRadius = self.innerShadowView.frame.width / 2
        self.innerShadowView.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.innerShadowView.layer.shadowColor = UIColor.gray.cgColor
        self.innerShadowView.layer.shadowRadius = 6
        self.innerShadowView.layer.shadowOpacity = 0.8
        
        let shadowPath = CGMutablePath()
        let inset = -self.innerShadowLayer.shadowRadius * 2.0
        shadowPath.addRect(self.bounds.insetBy(dx: inset, dy: inset))
        shadowPath.addRect(self.bounds)
        self.innerShadowLayer.path = shadowPath
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InnerButtonView {
    
    private func setUI() {
        self.backgroundColor = .white
        self.layer.masksToBounds = true
        self.layer.addSublayer(self.innerShadowLayer)
        
        innerShadowView.do {
            $0.backgroundColor = .black
        }
        
        innerButton.do {
            $0.backgroundColor = .white
            $0.setBackgroundColor(color: Color.gray4)
            $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
    }
    
    private func setLayout() {
        self.addSubviews(innerShadowView, innerButton)
        
        innerShadowView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(22)
        }
        
        innerButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(24)
        }
    }
}

extension InnerButtonView {
    @objc
    private func buttonTapped() {
        print("aaaaaaaa")
    }
}
