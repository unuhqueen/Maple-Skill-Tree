//
//  Persistence.swift
//  MapleSkillTree
//
//  Created by Seungwon Choi on 2022/05/04.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        func saveJob(jobsName: String, classesName: String) {
            let job = JobsEntity(context: viewContext)
            job.jobsName = jobsName
            job.classRelationship = ClassesEntity(context: viewContext)
            job.classRelationship?.classesName = classesName
        }
        
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        saveJob(jobsName: "히어로", classesName: "모험가")
        saveJob(jobsName: "팔라딘", classesName: "모험가")
        saveJob(jobsName: "다크나이트", classesName: "모험가")
        saveJob(jobsName: "불독", classesName: "모험가")
        saveJob(jobsName: "썬콜", classesName: "모험가")
        saveJob(jobsName: "비숍", classesName: "모험가")
        saveJob(jobsName: "보우마스터", classesName: "모험가")
        saveJob(jobsName: "신궁", classesName: "모험가")
        saveJob(jobsName: "패스파인더", classesName: "모험가")
        saveJob(jobsName: "나이트로드", classesName: "모험가")
        saveJob(jobsName: "섀도어", classesName: "모험가")
        saveJob(jobsName: "듀얼블레이드", classesName: "모험가")
        saveJob(jobsName: "바이퍼", classesName: "모험가")
        saveJob(jobsName: "캡틴", classesName: "모험가")
        saveJob(jobsName: "캐논슈터", classesName: "모험가")
        saveJob(jobsName: "소울마스터", classesName: "시그너스")
        saveJob(jobsName: "플레임위자드", classesName: "시그너스")
        saveJob(jobsName: "윈드브레이커", classesName: "시그너스")
        saveJob(jobsName: "나이트워커", classesName: "시그너스")
        saveJob(jobsName: "스트라이커", classesName: "시그너스")
        saveJob(jobsName: "미하일", classesName: "시그너스")
        saveJob(jobsName: "블래스터", classesName: "레지스탕스")
        saveJob(jobsName: "배틀메이지", classesName: "레지스탕스")
        saveJob(jobsName: "와일드헌터", classesName: "레지스탕스")
        saveJob(jobsName: "메카닉", classesName: "레지스탕스")
        saveJob(jobsName: "제논", classesName: "레지스탕스")
        saveJob(jobsName: "데몬슬레이어", classesName: "레지스탕스")
        saveJob(jobsName: "데몬어벤져", classesName: "레지스탕스")
        saveJob(jobsName: "메르세데스", classesName: "영웅")
        saveJob(jobsName: "아란", classesName: "영웅")
        saveJob(jobsName: "팬텀", classesName: "영웅")
        saveJob(jobsName: "루미너스", classesName: "영웅")
        saveJob(jobsName: "에반", classesName: "영웅")
        saveJob(jobsName: "은월", classesName: "영웅")
        saveJob(jobsName: "카데나", classesName: "노바")
        saveJob(jobsName: "엔젤릭버스터", classesName: "노바")
        saveJob(jobsName: "카이저", classesName: "노바")
        saveJob(jobsName: "카인", classesName: "노바")
        saveJob(jobsName: "아델", classesName: "레프")
        saveJob(jobsName: "아크", classesName: "레프")
        saveJob(jobsName: "일리움", classesName: "레프")
        saveJob(jobsName: "호영", classesName: "아니마")
        saveJob(jobsName: "라라", classesName: "영웅")
        saveJob(jobsName: "제로", classesName: "기타")
        saveJob(jobsName: "키네시스", classesName: "기타")
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "CoreDataModel")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
