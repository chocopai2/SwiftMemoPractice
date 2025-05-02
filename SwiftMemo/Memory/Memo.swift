//
//  Memo.swift
//  SwiftMemo
//
//  Created by wangjun on 5/2/25.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject/*데이터 리스트에 쉽게 바인딩을 위해, 메모편집*/ {
    let id: UUID
    @Published var Content: String
    let inserDate: Date //날짜
    
    init(Content: String, inserDate: Date = Date.now) {
        id = UUID()
        self.Content = Content
        self.inserDate = inserDate
    }
}
