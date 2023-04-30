//
//  ParticleEffect.swift
//  shout
//
//  Created by 김록원 on 2023/04/30.
//

import SwiftUI


extension View {
  @ViewBuilder
  func particleEffect(imageName: String, status: Bool, activeTint: Color, inActiveTint: Color) -> some View {
    self
      .modifier(
        ParticleModifier(image: imageName, isActive: status, activeTint: activeTint, inActiveTint: inActiveTint)
      )
  }
}

fileprivate struct ParticleModifier: ViewModifier {
  var image: String
  var isActive: Bool
  var activeTint: Color
  var inActiveTint: Color
  
  @State private var particles: [Particle] = []
  
  func body(content: Content) -> some View {
    content
      .overlay(alignment: .top) {
        ZStack {
          ForEach(particles) { particle in
            Image(image)
              .renderingMode(.template)
              .foregroundColor(isActive ? activeTint : inActiveTint)
              .scaleEffect(particle.scale)
              .offset(x: particle.randomX, y: particle.randomY)
              .opacity(particle.opacity)
              .opacity(isActive ? 1 : 0)
              .animation(.none, value: isActive)
          }
        }
        .onChange(of: isActive) { newValue in
          if particles.isEmpty {
            for _ in 1...15 {
              let particle = Particle()
              particles.append(particle)
            }
          }
          
          if !newValue {
            for index in particles.indices {
              particles[index].reset()
            }
          } else {
            for index in particles.indices {
              let total = CGFloat(particles.count)
              let progress = CGFloat(index) / total
              
              let maxX: CGFloat = (progress > 0.5) ? 100 : -100
              let maxY: CGFloat = 60
              
              let randomX: CGFloat = ((progress > 0.5 ? progress - 0.5 : progress) * maxX)
              let randomY: CGFloat = ((progress > 0.5 ? progress - 0.5 : progress) * maxY) + 15
              
              let randomScale: CGFloat = .random(in: 0.35...1)
              
              withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                let extraRandomX: CGFloat = (progress < 0.5 ? .random(in: 0...10) : .random(in: -10...0))
                let extraRandomY: CGFloat = .random(in: 0...30)
                
                particles[index].randomX = randomX + extraRandomX
                particles[index].randomY = -randomY - extraRandomY
              }
              
              withAnimation(.easeInOut(duration: 0.3)) {
                particles[index].scale = randomScale
              }
              
              withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(0.25 + (Double(index) * 0.005))) {
                particles[index].scale = 0.001
              }
            }
          }
        }
      }
  }
}

fileprivate struct Particle: Identifiable {
  var id: UUID = .init()
  var randomX: CGFloat = 0
  var randomY: CGFloat = 0
  var scale: CGFloat = 1
  
  var opacity: CGFloat = 0.5
  
  mutating func reset() {
    randomX = 0
    randomY = 0
    scale = 1
    opacity = 0.5
  }
}
