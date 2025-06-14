//
//  DetailView.swift
//  WomensFootballApp
//
//  Created by Claire Lister on 09/07/2024.
//
import SwiftUI

struct DetailView: View {
    var skill: SkillDetails
    @State private var isMastered: Bool
    @ObservedObject var viewModel: SkillsViewModel
    
    init(skill: SkillDetails, viewModel: SkillsViewModel) {
        self.skill = skill
        self.viewModel = viewModel
        _isMastered = State(initialValue: skill.mastered)
    }
    
    var body: some View {
        VStack {
         
            Text(skill.name)
                .font(.custom("Digital Arcade Regular", size: 24))
                .foregroundColor(.purple)
                .padding(.top, 40) // Adjust this for safe area
            
            Spacer().frame(height: 50)
    
            VStack(spacing: 20) {
                Button(action: {
                    isMastered.toggle()
                    viewModel.updateSkill(for: skill, mastered: isMastered)
                }) {
                    Text(isMastered ? "💪" : "💪🏻")
                        .font(.largeTitle)
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer().frame(height: 50)
                
                Image(skill.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 5)
                    .padding()
                
                Text(skill.description)
                    .font(.system(.body, design: .monospaced))
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                    .shadow(color: .black, radius: 2, x: 1, y: 1)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purple.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 8.0))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .padding(.horizontal)
            }
        }
        .padding()
        .onAppear {
            isMastered = skill.mastered
        }
    }
}
