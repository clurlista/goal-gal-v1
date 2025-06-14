//
//  Skill.swift
//  WomensFootballApp
//
//  Created by Claire Lister on 13/02/2025.
//
import SwiftUI

struct SkillDetails: Identifiable, Codable, Hashable {
    let name: String
    let image: String
    var description: String
    var mastered: Bool
    
    var id: UUID {
        return UUID()
    }
    
    static func == (lhs: SkillDetails, rhs: SkillDetails) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
