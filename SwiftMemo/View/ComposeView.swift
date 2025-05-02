//
//  ComposeView.swift
//  SwiftMemo
//
//  Created by wangjun on 5/2/25.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: MemoStore
    @Environment(\.dismiss) var dismiss
    @State private var content: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $content) //twowaybounding
                
            }
            .navigationTitle(Text("Compose"))
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
