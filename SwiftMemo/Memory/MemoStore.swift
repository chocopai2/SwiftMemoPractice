//
//  MemoStore.swift
//  SwiftMemo
//
//  Created by wangjun on 5/2/25.
//

import Foundation

class MemoStore: ObservableObject{
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(Content: "Hello, world", inserDate: Date.now),
            Memo(Content: "Awesome", inserDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(Content: "SwiftUI", inserDate: Date.now.addingTimeInterval(3600 * -48))
        ]
    }
    
    func insert(memo: String){
        list.insert(Memo(Content: memo), at: 0)
    }
    
    func update(memo: Memo?, content: String){
        guard let memo = memo else{
            return
        }
        
        memo.Content = content
    }
    
    func delete(memo: Memo){
        list.removeAll { $0.id == memo.id}
    }
    
    func delete(set: IndexSet){
        for index in set{
            list.remove(at: index)
        }
    }
    
}
