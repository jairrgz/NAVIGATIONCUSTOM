//
//  ViewControllerTwo.swift
//  NAVEGATION CUSTOM
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 7/01/25.
//

import UIKit

class ViewControllerTwo: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
           let scrollView = UIScrollView()
           scrollView.translatesAutoresizingMaskIntoConstraints = false
           return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupButtons()
    }
    
    private func setupScrollView() {
          view.addSubview(scrollView)
          NSLayoutConstraint.activate([
              scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
              scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
              scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
              scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
          ])
    }
    private func setupButtons() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        // Configurar constraints
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            // Esta constraint es importante para que el stackView tome el ancho del scrollView menos los márgenes
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40)
        ])
        
        // Crear botones para diferentes estilos
        let presentations = [
            ("1. Automatic - With CovertVertial", PresentationStyle.automatic, TransitionStyle.coverVertical),
            ("2. Automatic - With CrosDissolve", PresentationStyle.automatic, TransitionStyle.crossDissolve),
            ("3. Automatic - With FlipHorizontal", PresentationStyle.automatic, TransitionStyle.flipHorizontal),
            ("4. Automatic - With PartialCurl", PresentationStyle.automatic, TransitionStyle.partialCurl), //No funciona al parecer es por versión de MAC o XCODE
//
            ("5. CurrentContext - With CovertVertial", PresentationStyle.currentContext, TransitionStyle.coverVertical),
            ("6. CurrentContext - With CrosDissolve", PresentationStyle.currentContext, TransitionStyle.crossDissolve),
            ("7. CurrentContext - With FlipHorizontal", PresentationStyle.currentContext, TransitionStyle.flipHorizontal),
            ("8. CurrentContext - With PartialCurl", PresentationStyle.currentContext, TransitionStyle.partialCurl), // Tampoco funciona el partialCurl
            
            ("9. FormSheet - With CovertVertial", PresentationStyle.formSheet, TransitionStyle.coverVertical),
            ("10. FormSheet - With CrosDissolve", PresentationStyle.formSheet, TransitionStyle.crossDissolve),
            ("11. FormSheet - With FlipHorizontal", PresentationStyle.formSheet, TransitionStyle.flipHorizontal),
            ("12. FormSheet - With PartialCurl", PresentationStyle.formSheet, TransitionStyle.partialCurl), // Tampoco funciona el partialCurl
            
            ("13. FullScreen - With CovertVertial", PresentationStyle.fullScreen, TransitionStyle.coverVertical),
            ("14. FullScreen - With CrosDissolve", PresentationStyle.fullScreen, TransitionStyle.crossDissolve),
            ("15. FullScreen - With FlipHorizontal", PresentationStyle.fullScreen, TransitionStyle.flipHorizontal),
            ("16. FullScreen - With PartialCurl", PresentationStyle.fullScreen, TransitionStyle.partialCurl), // Tampoco funciona el partialCurl
            
            ("17. OverCurrentContext - With CovertVertial", PresentationStyle.overCurrentContext, TransitionStyle.coverVertical),
            ("18. OverCurrentContext - With CrosDissolve", PresentationStyle.overCurrentContext, TransitionStyle.crossDissolve),
            ("19. OverCurrentContext - With FlipHorizontal", PresentationStyle.overCurrentContext, TransitionStyle.flipHorizontal),
            ("20. OverCurrentContext - With PartialCurl", PresentationStyle.overCurrentContext, TransitionStyle.partialCurl), // Tampoco funciona el partialCurl
            
            ("21. OverFullScreen - With CovertVertial", PresentationStyle.overFullScreen, TransitionStyle.coverVertical),
            ("22. OverFullScreen - With CrosDissolve", PresentationStyle.overFullScreen, TransitionStyle.crossDissolve),
            ("23. OverFullScreen - With FlipHorizontal", PresentationStyle.overFullScreen, TransitionStyle.flipHorizontal),
            ("24. OverFullScreen - With PartialCurl", PresentationStyle.overFullScreen, TransitionStyle.partialCurl), // Tampoco funciona el partialCurl
            
            ("25. PageSheet - With CovertVertial", PresentationStyle.pageSheet, TransitionStyle.coverVertical),
            ("26. PageSheet - With CrosDissolve", PresentationStyle.pageSheet, TransitionStyle.crossDissolve),
            ("27.PageSheet - With FlipHorizontal", PresentationStyle.pageSheet, TransitionStyle.flipHorizontal),
            ("28. PageSheet - With PartialCurl", PresentationStyle.pageSheet, TransitionStyle.partialCurl)
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



