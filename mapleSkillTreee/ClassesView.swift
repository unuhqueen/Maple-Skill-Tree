//
//  ContentView.swift
//  mapleSkillTreee
//
//  Created by Seungwon Choi on 2022/04/29.
//

import SwiftUI

struct ClassesView: View {
    let classes: [String] = ["모험가", "시그너스", "레지스탕스", "영웅", "노바", "레프", "아니마", "기타"]
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: columns) {
                ForEach(classes, id: \.self) {i in
                    NavigationLink(destination: JobsView(classes: i)) {
                        ZStack(alignment: .bottomLeading) {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.orange)
                                .opacity(0.7)
                                .frame(height: 130)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 5)
                            Text(i)
                                .padding([.horizontal, .vertical], 20)
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold))
                            
                        }
                    }
                    .navigationTitle("직업군")
                    .navigationBarHidden(false)
                    .navigationBarTitleDisplayMode(.large)
                }
            }
            .padding(.horizontal, 10)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {print("star")}) {
                        Image(systemName: "star")
                            .foregroundColor(.orange)
                    }
                    Button(action: {print("search")}) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.orange)
                    }
                }
            }
        }
        .accentColor(.orange)
    }
}

struct ClassesView_Previews: PreviewProvider {
    static var previews: some View {
        ClassesView()
    }
}
