//
//  WolfActionGameView.swift
//  BabyBearBonanza
//
//  Created by Nicolae Chivriga on 18/12/2024.
//

import SwiftUI

struct WolfActionGameView: View {
    @State var animatingGoing: Bool = false
    @State var finishLoading: Bool = false
 
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image("logotip")
                .scaleEffect(animatingGoing ? 1 : 0.75)
                .opacity(!finishLoading ? 1 : 0)
            
            WKWebViewRepresentable(url: URL(string: "https://plays.org/game/we-bare-bears-baby-bear-bonanza/")!, onLoadCompletion: {
                withAnimation {
                    finishLoading = true
                } completion: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                }

            })
            .opacity(finishLoading ? 1 : 0)
            .ignoresSafeArea()
        }
        .navigationBarItems(leading: Image("ack")
            .resizable()
            .frame(width: 30, height: 28)
            .onTapGesture {
                dismiss()
            })
        .navigationBarBackButtonHidden()
        .onAppear() {
          
            withAnimation(Animation.bouncy(duration: 2.3).repeatForever()) {
                animatingGoing = true
            } completion: {
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
            }
        }
        
        
    }
}
