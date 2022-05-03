//
//  JobsView.swift
//  mapleSkillTreee
//
//  Created by Seungwon Choi on 2022/05/02.
//

import Foundation
import SwiftUI

struct JobsView: View {
    let classes: String
    
//    let adventurer: [String] = ["모험가", "히어로", "팔라딘", "다크나이트", "불독", "썬콜", "비숍", "보우마스터", "신궁", "패스파인더", "나이트로드", "섀도어", "듀얼블레이드", "바이퍼", "캡틴", "캐논슈터"]
//    let cygnus: [String] = ["시그너스", "소울마스터", "플레임위자드", "윈드브레이커", "나이트워커", "스트라이커"]
//    let registance: [String] = ["레지스탕스", "블래스터", "배틀메이지", "와일드헌터", "메카닉", "제논", "데몬슬레이어", "데몬어벤져"]
    let heroes: [String] = ["메르세데스", "아란", "팬텀", "루미너스", "에반", "은월"]
//    let nova: [String] = ["노바", "카데나", "엔젤릭버스터", "카이저", "카인"]
//    let ref: [String] = ["레프", "아델", "아크", "일리움"]
//    let anima: [String] = ["아니마", "호영", "라라"]
//    let etc: [String] = ["기타", "제로", "키네시스"]
    
    var body: some View {
            List {
                ForEach(heroes, id: \.self) {i in
                    NavigationLink(destination: SkillsView(jobs: i)) {
                        HStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.orange)
                                .opacity(0.7)
                                .frame(width: 100, height: 130)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 5)
                            Text(i)
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }
                    .navigationTitle(classes)
                    .navigationBarHidden(false)
                    .navigationBarTitleDisplayMode(.large)
                }
            }
    }
}

struct JobsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            JobsView(classes: "영웅")
        }
    }
}
