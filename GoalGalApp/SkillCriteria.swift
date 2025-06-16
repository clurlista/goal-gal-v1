//
//  SkillCriteria.swift
//  GoalGalApp
//
//  Created by Claire Lister on 16/06/2025.
//
import SwiftUI

struct SkillCriteria: Identifiable, Codable {
    let id = UUID()
    let description: String
    var isCompleted: Bool
}
