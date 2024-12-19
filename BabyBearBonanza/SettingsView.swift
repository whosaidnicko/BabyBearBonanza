//
//  SettingsView.swift
//  BabyBearBonanza
//
//  Created by Nicolae Chivriga on 18/12/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.requestReview) var requestReview
    var body: some View {
        ZStack {
            Image("bgS")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Button {
                    requestReview()
                } label: {
                    Image("btnM")
                        .overlay {
                            Text("STARS")
                                .font(.system(size: 50, weight: .heavy, design: .rounded))
                                .foregroundStyle(.gray)
                        }
                }

            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: Image("ack")
            .resizable()
            .frame(width: 30, height: 28)
            .onTapGesture {
                dismiss()
            })
    }
}
