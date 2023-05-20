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
    
    
    private let noticeProfileView = NoticeProfileView()
    private let noticeWeekView = NoticeWeekView(month: "", week: "")
    private let noticeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    private let noticeTitleModel = NoticeModel.fetchNoticeModelData()
    private var noticeServerModel: [NoticeServerModel] = []
    var month: String = ""
    var week: String = ""
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.clipsToBounds = true
        noticeWeekView.month = self.month
        noticeWeekView.week = self.week
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setNavigationBar()
        setDelegate()
        setRegister()
        fetchNotice()
    }
}

extension NoticeViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = Color.white
        
        noticeCollectionView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
            $0.isScrollEnabled = false
        }
        
        noticeWeekView.do {
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
            $0.makeBorder(width: 1, color: Color.main)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubviews(noticeProfileView, noticeWeekView, noticeCollectionView)
        
        noticeProfileView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(3)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(172)
        }
        
        noticeWeekView.snp.makeConstraints {
            $0.top.equalTo(noticeProfileView.snp.bottom).offset(24)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(14)
            $0.height.equalTo(55)
        }
        
        noticeCollectionView.snp.makeConstraints {
            $0.top.equalTo(noticeWeekView.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(204)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        noticeCollectionView.dataSource = self
        noticeCollectionView.delegate = self
    }
    
    private func setRegister() {
        noticeCollectionView.registerCell(NoticeCollectionViewCell.self)
    }
    
    private func popToHistory() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setNavigationBar() {
        navigationController?.navigationBar.tintColor = Color.gray9
        navigationController?.navigationBar.backgroundColor = Color.white

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: Image.backBtn,
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
        
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
    
    func labelWidthSize(index: Int) -> Int {
        let count = String(noticeServerModel.count)
        if count.count > 3 {
            let size = count.size(
                withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .bold)]).width + 36
            print(noticeServerModel.count)
            print(size)
            return Int(size)
        } else {
            return 60
        }
    }
    
    func countLabelSizeSetting(cell: NoticeCollectionViewCell?, indexPath: IndexPath) {
        cell?.setCountLabelSize(size: labelWidthSize(index: indexPath.row))
    }
    
    // MARK: - @objc Methods
    
    @objc private func backButtonTapped() {
        popToHistory()
    }
}

extension NoticeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = 60.0
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

extension NoticeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noticeServerModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: NoticeCollectionViewCell.self, indexPath: indexPath)
        print(indexPath.row)
        cell.setDataBind(model: noticeTitleModel[indexPath.row], serverModel: noticeServerModel[indexPath.row])
        countLabelSizeSetting(cell: cell, indexPath: indexPath)
        return cell
    }
}

extension NoticeViewController {
    
    func pass(week: String, month: String) {
        self.noticeWeekView.pass(week: week, month: month)
    }
    
    private func fetchNotice() {
        NoticeService.shared.notice { response in
            switch response {
            case .success(let data):
                guard let data = data as? NoticeResponse else { return }
                print("💚💚💚💚💚💚💚💚💚💚성공💚💚💚💚💚💚💚💚💚💚")
                dump(data)
                print("💚💚💚💚💚💚💚💚💚💚성공💚💚💚💚💚💚💚💚💚💚")
                self.noticeServerModel = data.convertToNotice()
                self.noticeCollectionView.reloadData()
            case .serverErr:
                print("🔥🔥🔥🔥🔥서버 이상 서버 이상🔥🔥🔥🔥🔥")
            case .pathErr:
                print("-----------경로이상-------------")
            case .networkErr:
                print("💧💧💧💧💧네트워크에런데 뭔ㄹ지머름💧💧💧💧💧")
            default:
                return
            }
        }
    }
}
