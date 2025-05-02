//
//  MainListView.swift
//  SwiftMemo
//
//  Created by wangjun on 5/2/25.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store: MemoStore
    
    var body: some View {
        NavigationView {
            List(store.list){ memo in
                VStack(alignment: .leading) {
                    Text(memo.Content)
                        .font(.body)
                        .lineLimit(1)
                    
                    Text(memo.inserDate, style: .date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .listStyle(.plain)
            .navigationTitle(Text("Memos"))
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}
