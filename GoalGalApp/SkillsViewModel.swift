//
//  SkillsViewModel.swift
//  WomensFootballApp
//
//  Created by Claire Lister on 13/08/2024.
//
import Combine
import SwiftUI

class SkillsViewModel: ObservableObject {
    var service: SkillsService
    @Published var skills: [SkillDetails] = []
    @Published var masteredSkills: [SkillDetails] = []
    
    init(service: SkillsService = SkillsService()) {
        self.service = service
        fetchSkills()
        getMasteredSkills()
    }
    
    func fetchSkills() {
        service.fetchSkills()
        self.skills = service.skills
    }
    
    func updateSkill(for skill: SkillDetails, mastered: Bool) {
        service.updateMastered(name: skill.name, value: mastered)
        fetchSkills()
    }
    
    func getMasteredSkills() {
        let filteredSkills = skills.filter { $0.mastered }
        self.masteredSkills = filteredSkills
        }
}








