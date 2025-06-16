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
            var skill = skills[index]
            skill.mastered = value
            skills[index] = skill
        } else {
            print("Skill not found.")
        }
    }
}
