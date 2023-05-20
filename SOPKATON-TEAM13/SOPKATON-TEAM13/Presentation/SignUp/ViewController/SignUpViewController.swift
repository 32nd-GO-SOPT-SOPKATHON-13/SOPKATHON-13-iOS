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
    private let errorLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetUI()
        SetLayout()
    }
}

extension SignUpViewController {
    
    private func SetUI() {
        
        navigationController?.isNavigationBarHidden = true
        
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
            $0.textColor = .white
            $0.textAlignment = .center
            $0.setPlaceholderColor(placeholderColor: .white)
            $0.tintColor = .white
        }
        
        underLineView.do {
            $0.backgroundColor = .white
        }
        
        loginButton.do {
            //            $0.isEnabled = false
            $0.backgroundColor = Color.white
            $0.setTitle("로그인", for: .normal)
            $0.titleLabel?.font = UIFont.appleSDGothic(weightOf: .Bold, sizeOf: .font22)
            $0.setTitleColor(Color.main, for: .normal)
            $0.makeCornerRound(radius: 20)
            $0.addTarget(self,
                         action: #selector(nextButtonTapped),
                         for: .touchUpInside)
        }
        
        errorLabel.do {
            $0.text = "잘못된 번호입니다."
            $0.font = UIFont.appleSDGothic(weightOf: .Regular, sizeOf: .font12)
            $0.textColor = Color.yellow
            $0.isHidden = true
        }
    }
    
    private func SetLayout() {
        
        view.backgroundColor = Color.main
        view.addSubviews(thumbnailImage, logoImage, problemIsMeLabel, inherentNumberTextField, underLineView, loginButton, errorLabel)
        
        thumbnailImage.snp.makeConstraints {
            $0.size.equalTo(200)
            $0.top.equalToSuperview().inset(123)
            $0.centerX.equalToSuperview()
        }
        
        logoImage.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(64)
            $0.top.equalTo(thumbnailImage.snp.bottom).offset(48)
            $0.centerX.equalToSuperview()
        }
        
        problemIsMeLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
        }
        
        inherentNumberTextField.snp.makeConstraints {
            $0.width.equalTo(228)
            $0.height.equalTo(48)
            $0.bottom.equalToSuperview().inset(178)
            $0.centerX.equalToSuperview()
        }
        
        underLineView.snp.makeConstraints {
            $0.width.equalTo(228)
            $0.height.equalTo(1)
            $0.bottom.equalTo(inherentNumberTextField.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints {
            $0.width.equalTo(240)
            $0.height.equalTo(48)
            $0.bottom.equalToSuperview().inset(82)
            $0.centerX.equalToSuperview()
        }
        
        errorLabel.snp.makeConstraints {
            $0.top.equalTo(underLineView.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func checkInherentNumber() {
        
        guard let text = inherentNumberTextField.text else { return }
        
        LoginService.get.signUp(keyNumber: text) { response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else { return }
                
                DispatchQueue.main.async {
                    self.underLineView.backgroundColor = Color.white
                    self.errorLabel.isHidden = true
                }
                dump(data)
            case .pathErr:
                print("tlqkftlqkf1")
                return
            case .serverErr:
                print("tlqkftlqkf2")
                DispatchQueue.main.async {
                    self.underLineView.backgroundColor = Color.yellow
                    self.errorLabel.isHidden = false
                }
                return
            case .networkErr:
                print("tlqkftlqkf3")
                return
            default:
                print("tlqkftlqkf")
                return
            }
        }
    }
    
    @objc func nextButtonTapped() {
        checkInherentNumber()
    }
}
