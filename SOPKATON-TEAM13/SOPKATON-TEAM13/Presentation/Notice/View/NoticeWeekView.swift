//
//  NoticeWeekView.swift
//  SOPKATON-TEAM13
//
//  Created by KJ on 2023/05/21.
//

import UIKit

import SnapKit
import Then

final class NoticeWeekView: UIView {
    
    // MARK: - UI Components
    
    private let noticeWeekLabel = UILabel()
    private let noiseCostLabel = UILabel()
    
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

extension NoticeWeekView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.white
        
        noticeWeekLabel.do {
            $0.text = "2023년 5월분"
            $0.font = .appleSDGothic(weightOf: .Bold, sizeOf: .font18)
            $0.textColor = Color.gray9
        }
        
        noiseCostLabel.do {
            $0.text = "소음관리비 부과현황"
            $0.font = .appleSDGothic(weightOf: .Regular, sizeOf: .font14)
            $0.textColor = Color.gray4
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(noticeWeekLabel, noiseCostLabel)
        
        noticeWeekLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
        }
        
        noiseCostLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
        }
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}
