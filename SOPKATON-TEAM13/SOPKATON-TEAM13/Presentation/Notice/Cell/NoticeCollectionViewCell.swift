//
//  NoticeCollectionViewCell.swift
//  SOPKATON-TEAM13
//
//  Created by KJ on 2023/05/21.
//

import UIKit

import Alamofire
import SnapKit
import Then

final class NoticeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let countLabel = UILabel()
    private let underLineView = UIView()
    
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

extension NoticeCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.white
        
        titleLabel.do {
            $0.font = .systemFont(ofSize: 18, weight: .bold)
            $0.textColor = Color.gray9
        }
        
        countLabel.do {
            $0.backgroundColor = Color.gray1
            $0.textColor = Color.main
            $0.font = .appleSDGothic(weightOf: .Bold, sizeOf: .font14)
            $0.textAlignment = .center
            $0.layer.cornerRadius = 16
            $0.clipsToBounds = true
            $0.sizeToFit()
        }
        
        underLineView.do {
            $0.backgroundColor = Color.green1
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(titleLabel, countLabel, underLineView)
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(17)
        }
        
        countLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(19)
            $0.height.equalTo(32)
        }
        
        underLineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(17)
            $0.height.equalTo(1)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: NoticeModel, serverModel: NoticeServerModel) {
        titleLabel.text = model.title
        countLabel.text = "\(serverModel.count)"
    }
    
    func setCountLabelSize(size: Int) {
        let size = size
        countLabel.snp.makeConstraints {
            $0.width.equalTo(size)
        }
    }
}
