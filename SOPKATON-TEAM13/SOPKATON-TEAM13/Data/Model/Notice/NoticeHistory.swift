//
//  NoticeHistory.swift
//  SOPKATON-TEAM13
//
//  Created by KJ on 2023/05/20.
//

import UIKit

struct NoticeModel {
    let title: String
}

struct NoticeServerModel {
    let count: Int
}

extension NoticeModel {
    
    static func fetchNoticeModelData() -> [NoticeModel] {
        NoticeModel(title: "내가 찔린 총 횟수"),
        NoticeModel(title: "내가 찔린 날 수"),
        NoticeModel(title: "아파트 평균 소음 발생 일 수")
    }
}

extension NoticeServerModel() -> [NoticeServerModel] {
    
    static func fetchNoticeServerModelDummy() -> [NoticeServerModel] {
        NoticeServerModel(count: "999"),
        NoticeServerModel(count: "99"),
        NoticeServerModel(count: "9999")
    }
}
