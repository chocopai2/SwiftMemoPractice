//
//  MemoCell.swift
//  SwiftMemo
//
//  Created by wangjun on 5/2/25.
//

import SwiftUI

struct MemoCell: View {
    @ObservedObject var memo: Memo //메모가 업데이트 되는순간 뷰도 업데이트 됨
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content)
                .font(.body)
                .lineLimit(1)
            
            Text(memo.inserDate, style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    MemoCell(memo: Memo(Content: "Test"))
}
