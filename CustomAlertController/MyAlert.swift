//
//  MyAlert.swift
//  CustomAlertController
//
//  Created by Сперанский Никита on 12.02.2022.
//

import UIKit

class MyAlert {
    
    struct Constants {
        static let backgroundAlfa: CGFloat = 0.8
    }
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    
    private let alertView: UIView = {
        let view = UIView()
        view.backgroundColor = .none
        return view
    }()
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .none
        imageView.image = UIImage(named: "  ") //------------------IMAGE
        return imageView
    }()
    
    private var myTargetView:UIView?
    
    
    func  showAlert(title: String, message: String, viewVontroller: UIViewController) {
        guard let targetView = viewVontroller.view else {return}
        
        myTargetView = targetView
        
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        
        
        alertView.frame = CGRect(x: 40,
                                 y: -300,
                                 width: targetView.frame.width - 80,
                                 height: 300)
        
        targetView.addSubview(alertView)
        
        backgroundImage.frame = CGRect(x: 0,
                                       y: 0,
                                       width: alertView.frame.width,
                                       height: alertView.frame.height)
        alertView.addSubview(backgroundImage)
        
        
        let titleLabel = UILabel(frame: CGRect(x: 0,
                                               y: 80,
                                               width: alertView.frame.width,
                                               height: 80))
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textColor = .purple
        titleLabel.textAlignment = .center
        alertView.addSubview(titleLabel)
        
        let messageLabel = UILabel(frame: CGRect(x: 70,
                                                 y: 80,
                                                 width: alertView.frame.width - 140,
                                                 height: 180))
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        alertView.addSubview(messageLabel)
        
        let buttonAlert = UIButton(frame: CGRect(x: 140,
                                                 y: alertView.frame.height - 90,
                                                 width: alertView.frame.width - 280,
                                                 height: 40))
//        let heart = UIImage(named: "heart")!.withRenderingMode(.alwaysOriginal)
//        buttonAlert.setImage(heart, for: .normal)
        
        buttonAlert.addAction(UIAction { [weak self] _ in
            self?.dissmissAlert()}, for: .touchUpInside)
        
        alertView.addSubview(buttonAlert)
        
        
        
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundView.alpha = Constants.backgroundAlfa
        }, completion: { done in
            if done {
                UIView.animate(withDuration: 0.3, animations: {
                    self.alertView.center = targetView.center
                })
            }
        })

        
        
    }
    
    func dissmissAlert(){
        
        guard let targetView = myTargetView else { return }

        UIView.animate(withDuration: 0.3, animations: {
            self.alertView.frame = CGRect(x: 40,
                                          y: targetView.frame.height,
                                          width: targetView.frame.width - 80,
                                          height: 300)
        }, completion: { done in
            if done {
                UIView.animate(withDuration: 0.3,
                               animations: {
                    self.backgroundView.alpha = 0
                }) { done in
                    if done {
                        self.alertView.removeFromSuperview()
                        self.backgroundView.removeFromSuperview()
                        self.backgroundImage.removeFromSuperview()
                    }
                }
            }
        })
    }
    
}
