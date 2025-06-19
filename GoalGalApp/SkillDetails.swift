//
//  SkillDetails.swift
//  WomensFootballApp
//
//  Created by Claire Lister on 13/02/2025.
//
import Foundation
import SwiftUI

struct SkillDetails: Codable, Hashable {
    let name: String
    let image: String
    var description: String
    var criteria: [SkillCriteria]
    
    var mastered: Bool
    
    mutating func update(checkPoint: SkillCriteria) {
        guard let itemIndex = criteria.firstIndex(where: { $0.description == checkPoint.description }) else { return }
        // Ensure progress stays within bounds
        let boundedProgress = min(max(checkPoint.progress, 0), 5)
        var updatedCheckPoint = checkPoint
        updatedCheckPoint.progress = boundedProgress
        criteria[itemIndex] = updatedCheckPoint
    }
}

struct SkillCriteria: Codable, Hashable {
    let description: String
    var progress: Int
    
    init(name: String, progress: Int = 0) {
        self.description = name
        self.progress = min(max(progress, 0), 5)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(description)
    }
    
    static func == (lhs: SkillCriteria, rhs: SkillCriteria) -> Bool {
        lhs.description == rhs.description
    }
}

extension SkillDetails: Comparable {
    static func == (lhs: SkillDetails, rhs: SkillDetails) -> Bool {
        return lhs.name == rhs.name
    }
    
    static func < (lhs: SkillDetails, rhs: SkillDetails) -> Bool {
        return lhs.name < rhs.name
    }
}
