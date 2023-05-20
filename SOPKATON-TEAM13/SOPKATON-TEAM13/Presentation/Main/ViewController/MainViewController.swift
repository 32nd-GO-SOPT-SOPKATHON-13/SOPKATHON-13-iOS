//
//  MainViewController.swift
//  SOPKATON-TEAM13
//
//  Created by KJ on 2023/05/20.
//

import UIKit

import SnapKit
import Then

class MainViewController: UIViewController {
    
    private lazy var buttonWidth = UIScreen.main.bounds.width / 3.15
    private lazy var buttonHeight = buttonWidth * 1.19
    
    private let upperHouseView = neighborButtonView(addressNumber: 1402, pokedCount: 999)
    private let lowerHouseView = neighborButtonView(addressNumber: 1402, pokedCount: 999)
    private let leftHouseView = neighborButtonView(addressNumber: 1402, pokedCount: 999)
    private let rightHouseView = neighborButtonView(addressNumber: 1402, pokedCount: 999)
    
    private let todayPokedCount = UILabel()
    private let mainCharacterImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension MainViewController {
    
    private func setUI() {
        view.backgroundColor = .white
        
        configureCell(999)
    }
    
    private func setLayout() {
        view.addSubviews(todayPokedCount, upperHouseView, lowerHouseView, leftHouseView, rightHouseView)
        
        todayPokedCount.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        }
        
        upperHouseView.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-buttonHeight - 5)
            $0.height.equalTo(buttonHeight)
            $0.width.equalTo(buttonWidth)
            $0.centerX.equalToSuperview()
        }
        
        lowerHouseView.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(buttonHeight + 5)
            $0.height.equalTo(buttonHeight)
            $0.width.equalTo(buttonWidth)
            $0.centerX.equalToSuperview()
        }
        
        leftHouseView.snp.makeConstraints {
            $0.height.equalTo(buttonHeight)
            $0.width.equalTo(buttonWidth)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        rightHouseView.snp.makeConstraints {
            $0.height.equalTo(buttonHeight)
            $0.width.equalTo(buttonWidth)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}

extension MainViewController {
    func configureCell(_ data: Int) {
        
        todayPokedCount.text = "오늘 나는 \(data) 번 찔렸어요 🥹"
        let fullText = todayPokedCount.text ?? ""
        let attribtuedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: "\(data)")
        attribtuedString.addAttribute(.foregroundColor, value: UIColor.MainColor, range: range)
        attribtuedString.addAttribute(.font, value: UIFont.appleSDGothic(weightOf: .Bold, sizeOf: .font24) ?? UIFont(), range: range)
        todayPokedCount.attributedText = attribtuedString
    }
}
