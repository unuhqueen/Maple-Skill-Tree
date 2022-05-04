//
//  ContentView.swift
//  mapleSkillTreee
//
//  Created by Seungwon Choi on 2022/04/29.
//

import SwiftUI
import PartialSheet

struct ClassesView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var classes: FetchedResults<ClassesEntity>
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: columns) {
                ForEach(classes, id: \.self) {i in
                    NavigationLink(destination: JobsView(classes: i.wrappedClassesName)) {
                        ZStack(alignment: .bottomLeading) {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.orange)
                                .opacity(0.7)
                                .frame(height: 130)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 5)
                            Text(i.wrappedClassesName)
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
        .attachPartialSheetToRoot()
        .onAppear {
            saveJobs(jobsName: "히어로", classesName: "모험가")
        }
    }
    
    func saveJobs(jobsName: String, classesName: String) {
        let job = JobsEntity(context: moc) // 여기서 에러 발생
        job.jobsName = jobsName
        job.classRelationship = ClassesEntity(context: moc)
        job.classRelationship?.classesName = classesName
        
        try? moc.save()
    }
}

struct ClassesView_Previews: PreviewProvider {
    static var previews: some View {
        ClassesView()
    }
}
