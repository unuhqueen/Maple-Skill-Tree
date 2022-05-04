//
//  DetailSheetView.swift
//  mapleSkillTreee
//
//  Created by Seungwon Choi on 2022/05/03.
//

import Foundation
import SwiftUI
import PartialSheet

struct DetailSheetView: View {
    let jobs: String
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                Section(header: Text(item.header)) {
                    Text(item.text)
                }
            }
        }.listStyle(InsetGroupedListStyle())
    }
}

struct Item: Hashable {
    let header: String
    let text: String
}

let items = [
    Item(header: "링크", text: "크리티컬 확률 10% / 15%"),
    Item(header: "유니온", text: "메소 획득량 2% / 3% / 4% / 5%")
]

struct DetailSheetView_Previews: PreviewProvider {
    static var previews: some View {
        DetailSheetView(jobs: "팬텀")
    }
}

