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

final class ViewController: UIViewController {
    
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
    }
}

extension ViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}
