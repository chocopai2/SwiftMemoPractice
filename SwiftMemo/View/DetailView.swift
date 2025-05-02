//
//  DetailView.swift
//  SwiftMemo
//
//  Created by wangjun on 5/2/25.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var memo: Memo //퍼블릭 시드 속성 변경시 뷰 자동 업데이트 됨
    
    @EnvironmentObject var store: MemoStore
    
    
    var body: some View {
        VStack {
            ScrollView{
                VStack{//방향 넘어갈 시 스크롤
                    HStack {
                        Text(memo.content)
                            .padding()
                        
                        Spacer(minLength: 0)
                    }
                    
                    Text(memo.inserDate, style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("memo check")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(memo: Memo(Content: "Hello"))
        .environmentObject(MemoStore())
}
