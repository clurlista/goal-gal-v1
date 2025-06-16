//
//  DetailView.swift
//  WomensFootballApp
//
//  Created by Claire Lister on 09/07/2024.
//
import SwiftUI

struct DetailView: View {
    @Binding var skill: SkillDetails
    @ObservedObject var viewModel: SkillsViewModel
    
    var body: some View {
        VStack {
         
            Text(skill.name)
                .font(.custom("Digital Arcade Regular", size: 24))
                .foregroundColor(.purple)
                .padding(.top, 40) 
            
            Spacer().frame(height: 50)
    
            VStack(spacing: 20) {
                Button(action: {
                    skill.mastered.toggle()
                    viewModel.updateSkill(for: skill, mastered: skill.mastered)
                }) {
                    Text(skill.mastered ? "💪" : "💪🏻")
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
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Checklist")
                        .font(.headline)
                    
                    ForEach($skill.criteria) { $item in
                        Toggle(isOn: $item.isCompleted) {
                            Text(item.description)
                                .font(.subheadline)
                        }
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                
                .padding(.horizontal)
            }
        }
        .padding()
    }
}
