//
//  ProfilePicIcon.swift
//  WomensFootballApp
//
//  Created by Claire Lister on 10/01/2025.
//
import SwiftUI

struct ProfilePicIcon: View {
    var imageName: String
    var size: CGFloat
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}
