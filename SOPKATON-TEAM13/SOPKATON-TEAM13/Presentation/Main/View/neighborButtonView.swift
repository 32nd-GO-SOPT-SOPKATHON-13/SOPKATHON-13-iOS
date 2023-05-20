//
//  neighborButtonView.swift
//  SOPKATON-TEAM13
//
//  Created by KYUBO A. SHIM on 2023/05/21.
//

import UIKit

final class neighborButtonView: UIView {
    
    private var address: Int
    private var pokedCount: Int
    
    private let houseAddressLabel = UILabel()
    private let countLabel = UILabel()
    private let innerButton = InnerButtonView()
    
    init(addressNumber address: Int, pokedCount: Int) {
        self.address = address
        self.pokedCount = pokedCount
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension neighborButtonView {
    
    private func setUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 8

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowRadius = 14
        self.layer.shadowOpacity = 0.08
        
        houseAddressLabel.do {
            $0.textColor = Color.gray9
            $0.font = .appleSDGothic(weightOf: .Bold, sizeOf: .font16)
            $0.textAlignment = .center
            $0.numberOfLines = 1
            
            $0.text = String(self.address) + "호"
        }
        
        countLabel.do {
            $0.textColor = UIColor.MainColor
            $0.font = .appleSDGothic(weightOf: .Bold, sizeOf: .font14)
            $0.textAlignment = .center
            $0.backgroundColor = UIColor.MainColor.withAlphaComponent(0.1)
            $0.makeCornerRound(radius: 16)
            
            $0.text = String(self.pokedCount)
        }
    }
    
    private func setLayout() {
        self.addSubviews(houseAddressLabel, countLabel, innerButton)
        
        houseAddressLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(32)
            $0.centerX.equalToSuperview()
        }

        countLabel.snp.makeConstraints {
            $0.top.equalTo(houseAddressLabel.snp.bottom).offset(4)
            $0.height.equalTo(32)
            $0.width.equalTo(64)
            $0.centerX.equalTo(houseAddressLabel.snp.centerX)
        }
        
        innerButton.snp.makeConstraints {
            $0.top.equalTo(countLabel.snp.bottom).offset(16)
            $0.size.equalTo(32)
            $0.centerX.equalToSuperview()
        }
        
    }
}

extension neighborButtonView {
    func configureView(passedAddress: Int, passedCount: Int) {
        self.address = passedAddress
        self.pokedCount = passedCount
        houseAddressLabel.text = String(passedAddress) + "호"
        countLabel.text = String(self.pokedCount)
    }
}
