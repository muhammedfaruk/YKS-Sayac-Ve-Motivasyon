//
//  FirstCell.swift
//  yks-sinav-sayaci
//
//  Created by Muhammed Faruk Söğüt on 24.01.2022.
//

import UIKit

class FirstCell: UITableViewCell {

    let label = MyCustomLabel(fonte: .ArialMT, size: 36, color: .black)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
 
    
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
}
