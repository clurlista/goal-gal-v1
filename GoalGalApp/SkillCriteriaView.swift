//
//  SkillCriteriaView.swift
//  GoalGalApp
//
//  Created by Claire Lister on 18/06/2025.
//
import SwiftUI

struct SkillCriteriaView: View {
    @ObservedObject var viewModel: SkillDetailViewModel

    var body: some View {
        List {
            ForEach(viewModel.skill.criteria, id: \.self) { criterion in
                HStack {
                    Text(criterion.description)
                    Spacer()
                    Text("\(criterion.progress)/5")
                    Image(systemName: criterion.progress == 5 ? "checkmark.circle.fill" : "circle")
                        .onTapGesture {
                            viewModel.toggleProgress(for: criterion)
                        }
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle(viewModel.skill.name)
    }
}

