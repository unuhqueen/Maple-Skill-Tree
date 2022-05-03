//
//  SkiilsView.swift
//  mapleSkillTreee
//
//  Created by Seungwon Choi on 2022/05/02.
//

import Foundation
import SwiftUI

struct SkillsView: View {
    let jobs: String
    private let firstSkill: [[String]] = [["더블피어싱", "1"], ["탤런트 오브 팬텀시프 Ⅰ", "1"], ["스위프트 팬텀", "M"], ["탤런트 오브 팬텀시프 Ⅰ", "M"], ["더블 피어싱", "M"], ["퀵 이베이젼", "M"]]
    @State private var selectedSkillIndex = "1"
    
    var body: some View {
        VStack {
            Picker("Skill Chapter", selection: $selectedSkillIndex, content: {
                Text("1").tag("1")
                Text("2").tag("2")
                Text("3").tag("3")
                Text("4").tag("4")
                Text("H").tag("H")
                Text("5").tag("5")
            })
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            Text("Selected skill: \(selectedSkillIndex)")
            
            List {
                ForEach(firstSkill, id: \.self) {i in
                    HStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.orange)
                            .opacity(0.7)
                            .frame(width: 50, height: 50)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 5)
                        Text(i[0])
                            .foregroundColor(.black)
                        Spacer()
                        ZStack(alignment: .center) {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.gray)
                                .opacity(0.2)
                                .frame(width: 50, height: 50)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 5)
                            Text(i[1])
                        }
                    }
                    .navigationTitle(jobs)
                    .navigationBarHidden(false)
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {print("상세보기")}) {
                    Text("상세보기")
                        .foregroundColor(.orange)
                }
            }
        }
        }
    }
    
    struct SkillsView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                SkillsView(jobs: "팬텀")
            }
        }
    }
