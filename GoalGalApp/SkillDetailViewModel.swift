//
//  SkillDetailViewModel.swift
//  GoalGalApp
//
//  Created by Claire Lister on 18/06/2025.
//
import SwiftUI

class SkillDetailViewModel: ObservableObject {
    @Published var skill: SkillDetails
    private var service: SkillsService

    var progress: Int {
        skill.criteria.filter { $0.progress == 5 }.count
    }

    var isMastered: Bool {
        !skill.criteria.isEmpty && skill.criteria.allSatisfy { $0.progress == 5 }
    }

    init(skill: SkillDetails, service: SkillsService) {
        self.skill = skill
        self.service = service
    }

    func toggleProgress(for criteria: SkillCriteria) {
        guard let index = skill.criteria.firstIndex(where: { $0.description == criteria.description }) else { return }

        skill.criteria[index].progress = min(skill.criteria[index].progress + 1, 5)

        service.updateSkill(skill) // Now valid
        skill = service.skills.first(where: { $0.name == skill.name }) ?? skill
    }

    var title: String {
        skill.name.uppercased()
    }
}


