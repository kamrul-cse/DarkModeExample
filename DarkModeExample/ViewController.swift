//
//  ViewController.swift
//  DarkModeExample
//
//  Created by Md. Kamrul Hasan on 23/2/21.
//

import UIKit

extension UIColor {
    public static var background: UIColor {
        get {
            if #available(iOS 13.0, *) {
                return .systemBackground
            } else {
                return .white
            }
            
        }
        
    }
}

class ViewController: UIViewController {
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        print("________________<START>_______________")
        print(#function)
        print(previousTraitCollection as Any)
        print("_________________<END>________________")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }

    func setupViews() {
        view.backgroundColor = .background
        
        let imageView = UIImageView(image: UIImage(named: "backgroundImage"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        let myLabel = UILabel()
        myLabel.text = "Greetings!"
        myLabel.textColor = UIColor(named: "yellowColor")
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        view.addSubview(myLabel)
        
        var blurEffect: UIBlurEffect
        if #available(iOS 13.0, *) {
            blurEffect = UIBlurEffect(style: .systemThinMaterial)
        } else {
            // Fallback on earlier versions
            blurEffect = UIBlurEffect(style: .light)
        }
        let blurView = UIVisualEffectView()
        blurView.effect = blurEffect
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        var vibrancyEffect: UIVibrancyEffect
        if #available(iOS 13, *) {
            vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect, style: .secondaryLabel)
        } else {
            vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        }
        
        let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyView.translatesAutoresizingMaskIntoConstraints = false
        blurView.contentView.addSubview(vibrancyView)
        
        vibrancyView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(nextAction(sender:))))
        
        let vibrantLabel = UILabel()
        vibrantLabel.translatesAutoresizingMaskIntoConstraints = false
        vibrantLabel.text = "Go Next"
        vibrantLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        vibrancyView.contentView.addSubview(vibrantLabel)
        
        blurView.layer.cornerRadius = 8.0
        blurView.clipsToBounds = true
        
        view.addSubview(blurView)
        
        NSLayoutConstraint.activate([
            
            myLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 36),
            myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            blurView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vibrancyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -148),

            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            blurView.heightAnchor.constraint(equalToConstant: 128),
            
            vibrancyView.centerXAnchor.constraint(equalTo: blurView.centerXAnchor),
            vibrancyView.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            
            vibrancyView.leadingAnchor.constraint(equalTo: blurView.leadingAnchor),
            vibrancyView.trailingAnchor.constraint(equalTo: blurView.trailingAnchor),
            
            vibrancyView.heightAnchor.constraint(equalTo: blurView.heightAnchor),
            
            vibrantLabel.centerXAnchor.constraint(equalTo: vibrancyView.centerXAnchor),
            vibrantLabel.centerYAnchor.constraint(equalTo: vibrancyView.centerYAnchor)
            
        ])
    }
    
    @objc func nextAction(sender:UITapGestureRecognizer){
        // do other task
        print(#function)
        ListVC.showVC(navController: navigationController)
    }

}

