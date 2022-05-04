//
//  ClassesEntity+CoreDataProperties.swift
//  mapleSkillTreee
//
//  Created by Seungwon Choi on 2022/05/03.
//
//

import Foundation
import CoreData


extension ClassesEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ClassesEntity> {
        return NSFetchRequest<ClassesEntity>(entityName: "ClassesEntity")
    }

    @NSManaged public var classesImage: URL?
    @NSManaged public var classesName: String?
    @NSManaged public var jobsRelationship: NSSet?
    
    public var wrappedClassesName: String {
        classesName ?? "Unknown Class"
    }
    
    public var jobsArray: [JobsEntity] {
        let set = jobsRelationship as? Set<JobsEntity> ?? []
        
        return set.sorted {
            $0.wrappedJobsName < $1.wrappedJobsName
        }
    }

}

// MARK: Generated accessors for jobsRelationship
extension ClassesEntity {

    @objc(addJobsRelationshipObject:)
    @NSManaged public func addToJobsRelationship(_ value: JobsEntity)

    @objc(removeJobsRelationshipObject:)
    @NSManaged public func removeFromJobsRelationship(_ value: JobsEntity)

    @objc(addJobsRelationship:)
    @NSManaged public func addToJobsRelationship(_ values: NSSet)

    @objc(removeJobsRelationship:)
    @NSManaged public func removeFromJobsRelationship(_ values: NSSet)

}

extension ClassesEntity : Identifiable {

}
