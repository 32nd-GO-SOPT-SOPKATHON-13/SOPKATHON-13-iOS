//
//  SignUpViewController.swift
//  SOPKATON-TEAM13
//
//  Created by KJ on 2023/05/20.
//

import UIKit

import SnapKit
import Then

class SignUpViewController: UIViewController {

    private let thumbnailImage = UIImageView()
    private let logoImage = UIImageView()
    private let problemIsMeLabel = UILabel()
    private let inherentNumberTextField = UITextField()
    private let underLineView = UIView()
    private let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SetUI()
        SetLayout()
    }
}

extension SignUpViewController {
    
    private func SetUI() {
        
        view.backgroundColor = Color.white
        
        thumbnailImage.do {
            $0.image = Image.thumbnailImage
        }
        
        logoImage.do {
            $0.image = Image.logoImage
        }
        
        problemIsMeLabel.do {
            $0.text = "소음의 문제는 나였다..."
            $0.font = UIFont.appleSDGothic(weightOf: .Bold, sizeOf: .font16)
            $0.textColor = Color.gray1
            $0.textAlignment = .center
        }
        
        inherentNumberTextField.do {
//            $0.keyboardType = .numberPad
            $0.autocapitalizationType = .none
            $0.autocorrectionType = .no
            $0.spellCheckingType = .no
            $0.placeholder = "고유번호를 입력하세요."
            $0.font = UIFont.appleSDGothic(weightOf: .Regular, sizeOf: .font16)
            $0.textColor = Color.white
            $0.textAlignment = .center
            $0.setPlaceholderColor(placeholderColor: Color.white)
            $0.tintColor = .white
        }
        
        underLineView.do {
            $0.backgroundColor = Color.white
        }
        
        loginButton.do {
//            $0.isEnabled = false
            $0.backgroundColor = Color.white
            $0.setTitle("로그인", for: .normal)
            $0.titleLabel?.font = UIFont.appleSDGothic(weightOf: .Bold, sizeOf: .font22)
            $0.setTitleColor(Color.main, for: .normal)
            $0.makeCornerRound(radius: 20)
        }
    }
    
    private func SetLayout() {
        
        view.backgroundColor = Color.main
        view.addSubviews(thumbnailImage, logoImage, problemIsMeLabel, inherentNumberTextField, underLineView, loginButton)
        
        thumbnailImage.snp.makeConstraints {
            $0.size.equalTo(200)
            $0.top.equalToSuperview().inset(123)
            $0.leading.equalToSuperview().inset(96.5)
        }
        
        logoImage.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(64)
            $0.top.equalTo(thumbnailImage.snp.bottom).offset(48)
            $0.leading.equalToSuperview().inset(96.5)
        }
        
        problemIsMeLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(123.5)
        }
        
        inherentNumberTextField.snp.makeConstraints {
            $0.width.equalTo(228)
            $0.height.equalTo(48)
            $0.top.equalTo(problemIsMeLabel.snp.bottom).offset(163)
            $0.leading.equalToSuperview().inset(82.5)
        }
        
        underLineView.snp.makeConstraints {
            $0.width.equalTo(228)
            $0.height.equalTo(1)
            $0.bottom.equalTo(inherentNumberTextField.snp.bottom)
            $0.leading.equalToSuperview().inset(82.5)
        }
        
        loginButton.snp.makeConstraints {
            $0.width.equalTo(240)
            $0.height.equalTo(48)
            $0.bottom.equalToSuperview().inset(82)
            $0.leading.equalToSuperview().inset(76.5)
        }
    }
}
