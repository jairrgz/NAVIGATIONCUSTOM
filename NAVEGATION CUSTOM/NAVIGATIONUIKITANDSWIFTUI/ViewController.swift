//
//  ViewController.swift
//  NAVEGATION CUSTOM
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 7/01/25.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    let vistaModal = UIViewController()
    let text = "Modal con ViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurarBoton()
    }
    
    private func configurarBoton() {
        let boton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        boton.center = view.center
        boton.setTitle("Mostrar Vista Modal", for: .normal)
        boton.backgroundColor = .blue
        boton.layer.cornerRadius = 10
        boton.addTarget(self, action: #selector(presentWithCustomTransition), for: .touchUpInside)
        view.addSubview(boton)
    }

    @objc func presentWithCustomTransition() {
        vistaModal.view.backgroundColor = .systemBlue
        vistaModal.modalPresentationStyle = .fullScreen
        vistaModal.transitioningDelegate = self
        
        // Agregar gesto para cerrar la vista modal
        let gestoTap = UITapGestureRecognizer(target: self, action: #selector(cerrarModal))
        vistaModal.view.addGestureRecognizer(gestoTap)
        
        present(vistaModal, animated: true)
    }
    
    @objc private func cerrarModal() {
        dismiss(animated: true)
    }

    // Delegados de transición
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInAnimator()
    }
}

import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // Actualizaciones si son necesarias
    }
} 

#Preview {
    ViewControllerRepresentable()
}
