//
//  JobsEntity+CoreDataProperties.swift
//  mapleSkillTreee
//
//  Created by Seungwon Choi on 2022/05/03.
//
//

import Foundation
import CoreData


extension JobsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JobsEntity> {
        return NSFetchRequest<JobsEntity>(entityName: "JobsEntity")
    }

    @NSManaged public var isStarred: Bool
    @NSManaged public var jobsImage: URL?
    @NSManaged public var jobsName: String?
    @NSManaged public var jobsLink: String?
    @NSManaged public var jobsUnion: String?
    @NSManaged public var classRelationship: ClassesEntity?
    @NSManaged public var skillsRelationship: NSSet?
    
    public var wrappedJobsName: String {
        jobsName ?? "Unknown Job"
    }
    
    public var wrappedJobsLink: String {
        jobsLink ?? "Unknown Link"
    }
    
    public var wrappedJobsUnion: String {
        jobsUnion ?? "Unknown Union"
    }
    
    public var skillsArray: [SkillsEntity] {
        let set = skillsRelationship as? Set<SkillsEntity> ?? []
        
        return set.sorted {
            $0.wrappedSkillsName[0] < $1.wrappedSkillsName[0]
        }
    }

}

// MARK: Generated accessors for skillsRelationship
extension JobsEntity {

    @objc(addSkillsRelationshipObject:)
    @NSManaged public func addToSkillsRelationship(_ value: SkillsEntity)

    @objc(removeSkillsRelationshipObject:)
    @NSManaged public func removeFromSkillsRelationship(_ value: SkillsEntity)

    @objc(addSkillsRelationship:)
    @NSManaged public func addToSkillsRelationship(_ values: NSSet)

    @objc(removeSkillsRelationship:)
    @NSManaged public func removeFromSkillsRelationship(_ values: NSSet)

}
