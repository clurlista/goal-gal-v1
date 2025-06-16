//
//  SkillsViewModel.swift
//  WomensFootballApp
//
//  Created by Claire Lister on 13/08/2024.
//
import Combine
import SwiftUI

class SkillsViewModel: ObservableObject {
    private var service: SkillsService
    @Published var skills: [SkillDetails] = []
    @Published var masteredSkills: [SkillDetails] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(service: SkillsService = SkillsService()) {
        self.service = service
        
        service.$skills
            .receive(on: DispatchQueue.main)
            .sink { [weak self] skills in
                self?.skills = skills
                self?.updateMasteredSkills()
            }
            .store(in: &cancellables)
        
        service.fetchSkills()
    }
    
    func fetchSkills() {
        service.fetchSkills()
        self.skills = service.skills
    }
    
    func updateSkill(for skill: SkillDetails, mastered: Bool) {
        service.updateMastered(name: skill.name, value: mastered)
    }
    
    private func updateMasteredSkills() {
        masteredSkills = skills.filter { $0.mastered }
    }
}








