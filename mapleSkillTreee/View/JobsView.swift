//
//  JobsView.swift
//  mapleSkillTreee
//
//  Created by Seungwon Choi on 2022/05/02.
//

import Foundation
import SwiftUI
import PartialSheet

struct JobsView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var jobs: FetchedResults<JobsEntity>
    let classes: String
    
    var body: some View {
            List {
                ForEach(jobs, id: \.self) {i in
                    NavigationLink(destination: SkillsView(jobs: i.wrappedJobsName)) {
                        HStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.orange)
                                .opacity(0.7)
                                .frame(width: 100, height: 130)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 5)
                            Text(i.wrappedJobsName)
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
