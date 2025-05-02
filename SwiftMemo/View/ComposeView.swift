//
//  ComposeView.swift
//  SwiftMemo
//
//  Created by wangjun on 5/2/25.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: MemoStore
    var memo: Memo? = nil
    @Environment(\.dismiss) var dismiss
    @State private var content: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $content) //twowaybounding
                    .padding()
                    .onAppear { //화면 표시되는 시점 초기화 구현
                        if let memo = memo{
                            content = memo.content
                        }
                    }
            }
            .navigationTitle(memo != nil ? "메모 편집" : "new memo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{ //바 버튼 추가시 툴바 모디파이어 사용
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if let memo = memo{
                            store.update(memo: memo, content: content)
                        } else{
                            store.insert(memo: content)
                        }
                        store.insert(memo: content)
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}

#Preview {
    ComposeView()
        .environmentObject(MemoStore())
}
