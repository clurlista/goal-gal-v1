//
//  SkillsService.swift
//  WomensFootballApp
//
//  Created by Claire Lister on 13/08/2024.
//

import Foundation

class SkillsService: ObservableObject {
    @Published var skills: [SkillDetails] = []
    
    func fetchSkills() {
        guard let path = Bundle.main.path(forResource: "SkillsDataJSON", ofType: "json") else {
            print("Can't find path")
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            self.skills = try JSONDecoder().decode([SkillDetails].self, from: data)
        } catch {
            print(error)
        }
    }
    
    func updateMastered(name: String, value: Bool) {
        if let index = skills.firstIndex(where: { $0.name == name }) {
            skills[index].mastered = value
            print("Updated skill mastery for \(name)")
        } else {
            print("Skill not found.")
        }
    }
    
    func updateSkill(_ updatedSkill: SkillDetails) {
        if let index = skills.firstIndex(where: { $0.name == updatedSkill.name }) {
            skills[index] = updatedSkill
            print("Updated full skill for \(updatedSkill.name)")
        } else {
            print("Skill not found.")
        }
    }
    
}
