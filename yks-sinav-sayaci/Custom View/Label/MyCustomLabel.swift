//
//  MyCustomLabel.swift
//  yks-sinav-sayaci
//
//  Created by Muhammed Faruk Söğüt on 22.01.2022.
//"Futura-Medium", "Futura-MediumItalic", "Futura-Bold", "Futura-CondensedMedium",

import UIKit

enum Fonts : String{    
    case ArialRoundedBold   = "ArialRoundedMTBold"
    case ArialMT            = "ArialMT"
}

class MyCustomLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(fonte: Fonts, size: CGFloat, color: UIColor) {
        self.init(frame: .zero)
        font        = UIFont(name: fonte.rawValue, size: size)
        textColor   = color
    }
    
    
    private func configure() {              
        numberOfLines             = 0
        adjustsFontSizeToFitWidth = true
        textAlignment             = .center
        translatesAutoresizingMaskIntoConstraints = false
      
    }

}
