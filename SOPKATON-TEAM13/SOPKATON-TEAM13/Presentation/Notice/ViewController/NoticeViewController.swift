//
//  NoticeViewController.swift
//  SOPKATON-TEAM13
//
//  Created by KJ on 2023/05/20.
//

import UIKit

import Alamofire
import SnapKit
import Then

final class NoticeViewController: UIViewController {
    
    // MARK: - UI Components
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setNavigationBar()
    }
}

extension NoticeViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = Color.white
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
    
    // MARK: - Methods
    
    private func setNavigationBar() {
//        navigationController?.navigationBar.tintColor = Color.white
        navigationController?.navigationBar.backgroundColor = Color.white
//        let buttonInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8) // 원하는 여백 값으로 수정
//        navigationItem.leftBarButtonItem = UIBarButtonItem(
//            image: Image.carrotBack,
//            style: .plain,
//            target: self,
//            action: #selector(backButtonTapped)
//        )
        
        let title = "소음고지서"
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: Color.gray8,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ]
        
        if let titleLabel = navigationItem.titleView as? UILabel {
            titleLabel.attributedText = NSAttributedString(string: title, attributes: attributes)
        } else {
            let titleLabel = UILabel()
            titleLabel.attributedText = NSAttributedString(string: title, attributes: attributes)
            navigationItem.titleView = titleLabel
        }
    }
    
    // MARK: - @objc Methods
}
