//
//  MyCustomButton.swift
//  yks-sinav-sayaci
//
//  Created by Muhammed Faruk Söğüt on 23.01.2022.
//

import UIKit

class MyCustomButton: UIButton {
    
    let butonImage = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(systemImage: String) {
        self.init(frame: .zero)
        let imageIcon = UIImage(systemName: systemImage)?.withTintColor(.white, renderingMode: .alwaysOriginal)
            butonImage.image = imageIcon
    }
    
    
    private func configure() {
        layer.cornerRadius  = 10
        clipsToBounds       = true
        backgroundColor     = UIColor(red: 7.0/255, green: 34.0/255, blue: 39.0/255, alpha: 0.6)
        translatesAutoresizingMaskIntoConstraints = false                     
        
        addSubview(butonImage)
        butonImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                    
            butonImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            butonImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            butonImage.widthAnchor.constraint(equalToConstant: 30),
            butonImage.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
