//
//  MainListView.swift
//  SwiftMemo
//
//  Created by wangjun on 5/2/25.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store: MemoStore
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List(store.list){ memo in
                NavigationLink {
                    DetailView(memo: memo)
                } label: {
                    MemoCell(memo: memo)
                }
            }
            .listStyle(.plain)
            .navigationTitle(Text("Memos"))
            .toolbar {
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showComposer) {
                ComposeView()
            }
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}

