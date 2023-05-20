//
//  MainViewController.swift
//  SOPKATON-TEAM13
//
//  Created by KJ on 2023/05/20.
//

import UIKit

import SnapKit
import Then

final class MainViewController: UIViewController {
    
    private let mainAPIManager = MainCountManager.shared
    private lazy var buttonWidth = UIScreen.main.bounds.width / 3.08
    private lazy var buttonHeight = buttonWidth * 1.19
    private var initialData: NeighborModel = NeighborModel(upperCount: [], lowerCount: [], leftCount: [], rightCount: [], myCount: 0)
    
    private let upperHouseView = neighborButtonView(addressNumber: 1402, pokedCount: 999)
    private let lowerHouseView = neighborButtonView(addressNumber: 1402, pokedCount: 999)
    private let leftHouseView = neighborButtonView(addressNumber: 1402, pokedCount: 999)
    private let rightHouseView = neighborButtonView(addressNumber: 1402, pokedCount: 999)
    
    private let todayPokedCount = UILabel()
    private let mainCharacterImageView = UIImageView()
    private let moveToBillButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        getData { [weak self] in
            self?.upperHouseView.configureView(passedAddress: $0.upperCount[0], passedCount: $0.upperCount[1])
            self?.lowerHouseView.configureView(passedAddress: $0.lowerCount[0], passedCount: $0.lowerCount[1])
            self?.leftHouseView.configureView(passedAddress: $0.leftCount[0], passedCount: $0.leftCount[1])
            self?.rightHouseView.configureView(passedAddress: $0.rightCount[0], passedCount: $0.rightCount[1])
            self?.configureCell($0.myCount)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension MainViewController {
    
    private func setUI() {
        view.backgroundColor = .white
        
        upperHouseView.do {
            $0.isUserInteractionEnabled = true
            $0.addTarget(self, action: #selector(upperButtonTapped), for: .touchUpInside)
        }
        
        lowerHouseView.do {
            $0.isUserInteractionEnabled = true
            $0.addTarget(self, action: #selector(lowerButtonTapped), for: .touchUpInside)
        }
        
        leftHouseView.do {
            $0.isUserInteractionEnabled = true
            $0.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        }
        
        rightHouseView.do {
            $0.isUserInteractionEnabled = true
            $0.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        }
        
        mainCharacterImageView.do {
            $0.image = UIImage(named: "img_thumbnail")
            $0.contentMode = .scaleAspectFit
        }
        
        moveToBillButton.do {
            $0.setImage(UIImage(named: "bill")?.withRenderingMode(.alwaysOriginal), for: .normal)
            $0.addTarget(self, action: #selector(moveToBillPage), for: .touchUpInside)
        }
    }
    
    private func setLayout() {
        view.addSubviews(todayPokedCount, upperHouseView, lowerHouseView, leftHouseView, rightHouseView, mainCharacterImageView, moveToBillButton)
        
        todayPokedCount.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
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
        
        mainCharacterImageView.snp.makeConstraints {
            $0.centerY.equalTo(rightHouseView.snp.centerY)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(90)
        }
        
        moveToBillButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(lowerHouseView.snp.bottom).offset(70)
        }
    }
    
    private func getData(completion: @escaping (NeighborModel) -> Void) {
        mainAPIManager.getCounts { response in
            switch response {
            case .success(let data):

                guard let data = data as? MainResponses else {
                    return }
                let countData = data.data
                self.initialData.upperCount = countData.up
                self.initialData.lowerCount = countData.down
                self.initialData.rightCount = countData.dataRight
                self.initialData.leftCount = countData.dataLeft
                self.initialData.myCount = countData.receiveCount
                completion(self.initialData)
            default:
                break
            }
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
    
    func jumpAnimation() {
        let animation = CAKeyframeAnimation(keyPath: "position.y")
        animation.values = [0, 4, -7, 7, -4, 0]
        animation.keyTimes = [0, 0.1, 0.2, 0.3, 0.41, 0.55]
        animation.duration = 0.55
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        mainCharacterImageView.layer.add(animation, forKey: nil)
    }
    
    func shakeAnimation() {
        let animation = CAKeyframeAnimation(keyPath: "position.x")
        animation.values = [0, 4, -7, 7, -4, 0]
        animation.keyTimes = [0, 0.1, 0.2, 0.3, 0.41, 0.55]
        animation.duration = 0.55
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        mainCharacterImageView.layer.add(animation, forKey: nil)
    }
}

extension MainViewController {
    @objc
    private func moveToBillPage() {
        let nextVC = HistoryViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc
    private func upperButtonTapped() {
        upperHouseView.isViewClicked()
        jumpAnimation()
    }
    
    @objc
    private func lowerButtonTapped() {
        lowerHouseView.isViewClicked()
        jumpAnimation()
    }
    
    @objc
    private func leftButtonTapped() {
        leftHouseView.isViewClicked()
        shakeAnimation()
    }
    
    @objc
    private func rightButtonTapped() {
        rightHouseView.isViewClicked()
        shakeAnimation()
    }
}
