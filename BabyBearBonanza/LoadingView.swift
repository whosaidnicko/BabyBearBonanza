//
//  LoadingView.swift
//  BabyBearBonanza
//
//  Created by Nicolae Chivriga on 18/12/2024.
//

import SwiftUI

struct LoadingView: View {
    @State var animatingGoing: Bool = false
    @State var goToMenu: Bool = false
    var body: some View {
        ZStack {
            Image("bgS")
                .resizable()
                .ignoresSafeArea()
            
            NavigationLink("", destination: MenuView(), isActive: $goToMenu)
            VStack {
                Image("logotip")
                    .scaleEffect(animatingGoing ? 1 : 0.75)
            }
            .onAppear() {
              
                withAnimation(Animation.bouncy(duration: 2.3).repeatForever()) {
                    animatingGoing = true
                } completion: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    goToMenu = true
                }
               
            }
        }
    }
}
