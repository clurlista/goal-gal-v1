//
//  SkillSummaryView.swift
//  WomensFootballApp
//
//  Created by Claire Lister on 30/07/2024.
//
import SwiftUI

struct SkillSummaryView: View {
    var skill: SkillDetails
    @State private var isMastered: Bool
    @ObservedObject var viewModel: SkillsViewModel

    init(skill: SkillDetails, viewModel: SkillsViewModel) {
        self.skill = skill
        self.viewModel = viewModel
        _isMastered = State(initialValue: skill.mastered)
    }
    var body: some View {
            Text(skill.name)
                .headerFont()
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .font(.system(size: 20, weight: .bold))
                .shadow(color: .black, radius: 2, x: 1, y: 1)
                .padding(.horizontal)
                .clipShape(RoundedRectangle(cornerRadius: 8.0))
                .background(Color.purple.opacity(0.6))
                .overlay(
                    RoundedRectangle(cornerRadius: 8.0)
                        .stroke(Color.black, lineWidth: 2)
                    
                )
    }
}
