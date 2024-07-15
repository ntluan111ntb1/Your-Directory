//
//  LottieView.swift
//  Your Directory
//
//  Created by LuanNT29 on 18/06/2024.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {

    var animationName: String
    var loopMode: LottieLoopMode

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> some UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView()

        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = loopMode

        if let animation = LottieAnimation.named(animationName) {
            animationView.animation = animation
            animationView.play()
        }

        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: view.topAnchor),
            animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
