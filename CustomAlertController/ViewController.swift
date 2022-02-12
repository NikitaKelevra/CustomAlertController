//
//  ViewController.swift
//  CustomAlertController
//
//  Created by Сперанский Никита on 12.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let myButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = .purple
        button.setTitle("Show Alert", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    let customAlert = MyAlert()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue.withAlphaComponent(60)
        setConstrains()
        
        myButton.addAction(UIAction { [weak self] _ in
            self?.myButtonTapped()}, for: .touchUpInside)
    }

    
    func myButtonTapped() {
        customAlert.showAlert(title: "LIKE", message: "SWIFT Greg", viewVontroller: self)
    }

}







extension ViewController {
    func setConstrains() {
        view.addSubview(myButton)
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myButton.heightAnchor.constraint(equalToConstant: 70),
            myButton.widthAnchor.constraint(equalToConstant: 300)

        
        ])
    }
}
