//
//  ViewControllerTwo.swift
//  NAVEGATION CUSTOM
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 7/01/25.
//

import UIKit

class ViewControllerTwo: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    private func setupButtons() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        // Configurar constraints
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 350)
        ])
        
        // Crear botones para diferentes estilos
        let presentations = [
            ("Automatic - With CovertVertial", PresentationStyle.automatic, TransitionStyle.coverVertical),
            ("Automatic - With CrosDissolve", PresentationStyle.automatic, TransitionStyle.crossDissolve),
            ("Automatic - With FlipHorizontal", PresentationStyle.automatic, TransitionStyle.flipHorizontal),
            ("Automatic - With PartialCurl", PresentationStyle.automatic, TransitionStyle.partialCurl), //No funciona al parecer es por versión de MAC o XCODE
//
            ("CurrentContext - With CovertVertial", PresentationStyle.currentContext, TransitionStyle.coverVertical),
            ("CurrentContext - With CrosDissolve", PresentationStyle.currentContext, TransitionStyle.crossDissolve),
            ("CurrentContext - With FlipHorizontal", PresentationStyle.currentContext, TransitionStyle.flipHorizontal),
            ("CurrentContext - With PartialCurl", PresentationStyle.currentContext, TransitionStyle.partialCurl), // Tampoco funciona el partialCurl
            
            ("FormSheet - With CovertVertial", PresentationStyle.formSheet, TransitionStyle.coverVertical),
            ("FormSheet - With CrosDissolve", PresentationStyle.formSheet, TransitionStyle.crossDissolve),
            ("FormSheet - With FlipHorizontal", PresentationStyle.formSheet, TransitionStyle.flipHorizontal),
            ("FormSheet - With PartialCurl", PresentationStyle.formSheet, TransitionStyle.partialCurl), // Tampoco funciona el partialCurl
            
            ("FullScreen - With CovertVertial", PresentationStyle.fullScreen, TransitionStyle.coverVertical),
            ("FullScreen - With CrosDissolve", PresentationStyle.fullScreen, TransitionStyle.crossDissolve),
            ("FullScreen - With FlipHorizontal", PresentationStyle.fullScreen, TransitionStyle.flipHorizontal),
            ("FullScreen - With PartialCurl", PresentationStyle.fullScreen, TransitionStyle.partialCurl), // Tampoco funciona el partialCurl
            
            ("OverCurrentContext - With CovertVertial", PresentationStyle.overCurrentContext, TransitionStyle.coverVertical),
            ("OverCurrentContext - With CrosDissolve", PresentationStyle.overCurrentContext, TransitionStyle.crossDissolve),
            ("OverCurrentContext - With FlipHorizontal", PresentationStyle.overCurrentContext, TransitionStyle.flipHorizontal),
            ("OverCurrentContext - With PartialCurl", PresentationStyle.overCurrentContext, TransitionStyle.partialCurl), // Tampoco funciona el partialCurl
            
            ("OverFullScreen - With CovertVertial", PresentationStyle.overFullScreen, TransitionStyle.coverVertical),
            ("OverFullScreen - With CrosDissolve", PresentationStyle.overFullScreen, TransitionStyle.crossDissolve),
            ("OverFullScreen - With FlipHorizontal", PresentationStyle.overFullScreen, TransitionStyle.flipHorizontal),
            ("OverFullScreen - With PartialCurl", PresentationStyle.overFullScreen, TransitionStyle.partialCurl), // Tampoco funciona el partialCurl
            
            ("PageSheet - With CovertVertial", PresentationStyle.pageSheet, TransitionStyle.coverVertical),
            ("PageSheet - With CrosDissolve", PresentationStyle.pageSheet, TransitionStyle.crossDissolve),
            ("PageSheet - With FlipHorizontal", PresentationStyle.pageSheet, TransitionStyle.flipHorizontal),
            ("PageSheet - With PartialCurl", PresentationStyle.pageSheet, TransitionStyle.partialCurl)
        ]
        
        for (title, presentation, transition) in presentations {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 10
            button.tag = presentations.firstIndex(where: { $0.0 == title })!
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
            
            // Configurar altura del botón
            button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        }
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        let presentations = [
            (PresentationStyle.automatic, TransitionStyle.coverVertical),
            (PresentationStyle.automatic, TransitionStyle.crossDissolve),
            (PresentationStyle.automatic, TransitionStyle.flipHorizontal),
            (PresentationStyle.automatic, TransitionStyle.partialCurl),
            
            (PresentationStyle.currentContext, TransitionStyle.coverVertical),
            (PresentationStyle.currentContext, TransitionStyle.crossDissolve),
            (PresentationStyle.currentContext, TransitionStyle.flipHorizontal),
            (PresentationStyle.currentContext, TransitionStyle.partialCurl),
            
            (PresentationStyle.formSheet, TransitionStyle.coverVertical),
            (PresentationStyle.formSheet, TransitionStyle.crossDissolve),
            (PresentationStyle.formSheet, TransitionStyle.flipHorizontal),
            (PresentationStyle.formSheet, TransitionStyle.partialCurl),
            
            (PresentationStyle.fullScreen, TransitionStyle.coverVertical),
            (PresentationStyle.fullScreen, TransitionStyle.crossDissolve),
            (PresentationStyle.fullScreen, TransitionStyle.flipHorizontal),
            (PresentationStyle.fullScreen, TransitionStyle.partialCurl),
            
            (PresentationStyle.overCurrentContext, TransitionStyle.coverVertical),
            (PresentationStyle.overCurrentContext, TransitionStyle.crossDissolve),
            (PresentationStyle.overCurrentContext, TransitionStyle.flipHorizontal),
            (PresentationStyle.overCurrentContext, TransitionStyle.partialCurl), // Tampoco funciona el partialCurl
            
            (PresentationStyle.overFullScreen, TransitionStyle.coverVertical),
            (PresentationStyle.overFullScreen, TransitionStyle.crossDissolve),
            (PresentationStyle.overFullScreen, TransitionStyle.flipHorizontal),
            (PresentationStyle.overFullScreen, TransitionStyle.partialCurl), // Tampoco funciona el partialCurl
            
            (PresentationStyle.pageSheet, TransitionStyle.coverVertical),
            (PresentationStyle.pageSheet, TransitionStyle.crossDissolve),
            (PresentationStyle.pageSheet, TransitionStyle.flipHorizontal),
            (PresentationStyle.pageSheet, TransitionStyle.partialCurl)
        ]
        
        let (presentationStyle, transitionStyle) = presentations[sender.tag]
        presentViewController(with: presentationStyle, transition: transitionStyle)
    }
    
    private func presentViewController(with style: PresentationStyle, transition: TransitionStyle) {
        let modalVC = UIViewController()
        modalVC.view.backgroundColor = .systemBlue
        modalVC.modalPresentationStyle = style.uikitStyle
        modalVC.modalTransitionStyle = transition.uikitStyle
        
        // Agregar botón para cerrar
        let closeButton = UIButton(frame: CGRect(x: 20, y: 40, width: 100, height: 40))
        closeButton.setTitle("Cerrar", for: .normal)
        closeButton.backgroundColor = .white
        closeButton.setTitleColor(.blue, for: .normal)
        closeButton.layer.cornerRadius = 8
        closeButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        modalVC.view.addSubview(closeButton)
        
        present(modalVC, animated: true)
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
}

import SwiftUI

struct ViewControllerTwoRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewControllerTwo {
        return ViewControllerTwo()
    }
    
    func updateUIViewController(_ uiViewController: ViewControllerTwo, context: Context) {
        // Actualizaciones si son necesarias
    }
}

#Preview {
    ViewControllerTwoRepresentable()
}



