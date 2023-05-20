//
//  NoticeProfileView.swift
//  SOPKATON-TEAM13
//
//  Created by KJ on 2023/05/21.
//

import UIKit

import SnapKit
import Then

final class NoticeProfileView: UIView {
    
    // MARK: - UI Components
    
    private let headerLineView = UIView()
    private let noticeImageView = UIImageView()
    private let weekNoisePeopleLabel = UILabel()
    private let userNameLabel = UILabel()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NoticeProfileView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.gray4
        
        headerLineView.do {
            $0.backgroundColor = Color.gray7
        }
        
        weekNoisePeopleLabel.do {
            $0.font = .appleSDGothic(weightOf: .Bold, sizeOf: .font24)
            $0.text = "이주의 소문나"
            $0.partColorChange(targetString: "소문나", textColor: Color.gray1)
        }
        
        userNameLabel.do {
            $0.font = .appleSDGothic(weightOf: .Bold, sizeOf: .font24)
            $0.textColor = Color.gray9
            $0.text = "권정 귀하"
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(headerLineView, weekNoisePeopleLabel, userNameLabel)
        
        headerLineView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(8)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(17)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(31)
        }
        
        weekNoisePeopleLabel.snp.makeConstraints {
            $0.bottom.equalTo(userNameLabel.snp.top).offset(-4)
            $0.trailing.equalTo(userNameLabel)
            $0.height.equalTo(31)
        }
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}
