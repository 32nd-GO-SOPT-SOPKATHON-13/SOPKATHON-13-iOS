//
//  HistoryTableViewCell.swift
//  SOPKATON-TEAM13
//
//  Created by Minjoo Kim on 2023/05/21.
//


import UIKit

import SnapKit
import Then

final class HistoryTableViewCell: UITableViewCell {
    
    static let identifier = "CarrotTableViewCell"
    
    private let dateLabel = UILabel()
    public let thisweekLabel = UILabel()
    public let divisionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        
        separatorInset.left = 0
        
        selectionStyle = .none

        dateLabel.do {
            $0.font = UIFont.systemFont(ofSize: 16)
            $0.textColor = Color.gray8
        }
        
        thisweekLabel.do {
            $0.font = .appleSDGothic(weightOf: .Bold, sizeOf: .font14)
            $0.backgroundColor = Color.main
            $0.textColor = Color.white
            $0.text = "이번주 통지서"
            $0.textAlignment = .center
            $0.layer.cornerRadius = 15
            $0.clipsToBounds = true
            $0.isHidden = true
        }
        
        divisionLabel.do {
            $0.backgroundColor = Color.gray3
        }
        
    }
    
    func setLayout() {
        
        [dateLabel, thisweekLabel, divisionLabel]
            .forEach { contentView.addSubview($0) }
        
        
        dateLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(33)
        }
        thisweekLabel.snp.makeConstraints {
            $0.centerY.equalTo(dateLabel)
            $0.trailing.equalToSuperview().inset(29)
            $0.width.equalTo(93)
            $0.height.equalTo(29)
        }
        divisionLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(17)
            $0.height.equalTo(1)
        }
        
        
    }
    
    func configureCell(_ data: HistoryData) {
        
        dateLabel.text = "\(data.month)월 \(data.week)주차 (\(data.first)-\(data.last))"
        let fullText = dateLabel.text ?? ""
        let attribtuedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: "(\(data.first)-\(data.last))")
        attribtuedString.addAttribute(.foregroundColor, value: Color.gray5, range: range)
        dateLabel.attributedText = attribtuedString
    }
}


extension UIView {
    
    func makeRounded(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
}
