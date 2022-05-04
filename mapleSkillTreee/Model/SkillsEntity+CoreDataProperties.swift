//
//  SkillsEntity+CoreDataProperties.swift
//  mapleSkillTreee
//
//  Created by Seungwon Choi on 2022/05/03.
//
//

import Foundation
import CoreData


extension SkillsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SkillsEntity> {
        return NSFetchRequest<SkillsEntity>(entityName: "SkillsEntity")
    }

    @NSManaged public var skillsDegree: String?
    @NSManaged public var skillsName: [String]?
    @NSManaged public var skillsImage: URL?
    @NSManaged public var jobRelationship: JobsEntity?
    
    public var wrappedSkillsName: [String] {
        skillsName ?? ["Unknown Skill", " "]
    }
    
    public var wrappedSkillsDegree: String {
        skillsDegree ?? "Unknown Degree"
    }

}
