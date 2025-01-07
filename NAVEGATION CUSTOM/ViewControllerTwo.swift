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
//            PresentationStyle
//            case automatic
//            case currentContext       
//            case formSheet
//            case fullScreen
//            case overCurrentContext
//            case overFullScreen
//            case pageSheet
            
//            Transition
//            case coverVertical
//            case flipHorizontal
//            case crossDissolve
//            case partialCurl
            
        //CrossDisolve an PartialCurl solo hacen hasta cierta parte el modal y flipHorizontal and CovertVertical cubren todo
            ("Automatic - With CovertVertial", PresentationStyle.automatic, TransitionStyle.coverVertical),
            ("Automatic - With CrosDissolve", PresentationStyle.automatic, TransitionStyle.crossDissolve),
            ("Automatic - With FlipHorizontal", PresentationStyle.automatic, TransitionStyle.flipHorizontal),
//            ("Automatic - With PartialCurl", PresentationStyle.automatic, TransitionStyle.partialCurl),
//            
//            ("CurrentContext - With CovertVertial", PresentationStyle.currentContext, TransitionStyle.coverVertical),
//            ("CurrentContext - With CrosDissolve", PresentationStyle.currentContext, TransitionStyle.crossDissolve),
//            ("CurrentContext - With FlipHorizontal", PresentationStyle.currentContext, TransitionStyle.flipHorizontal),
//            ("CurrentContext - With PartialCurl", PresentationStyle.currentContext, TransitionStyle.partialCurl),
            
            
            
            
            
            ("Page Sheet", PresentationStyle.pageSheet, TransitionStyle.crossDissolve),
            ("Over FullScreen", PresentationStyle.overFullScreen, TransitionStyle.flipHorizontal),
            ("Form Sheet", PresentationStyle.formSheet, TransitionStyle.flipHorizontal)
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
//            (PresentationStyle.automatic, TransitionStyle.partialCurl),

            
            
            (PresentationStyle.pageSheet, TransitionStyle.crossDissolve),
            (PresentationStyle.overFullScreen, TransitionStyle.flipHorizontal),
            (PresentationStyle.formSheet, TransitionStyle.flipHorizontal)
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



