//
//  MotivationVC.swift
//  yks-sinav-sayaci
//
//  Created by Muhammed Faruk Söğüt on 23.01.2022.
//

import UIKit

class MotivationVC: UIViewController {
  
    let motivationImage     = UIImageView()
    let motivationTitle     = MyCustomLabel(size: 46,color: .white)
    let motivationLabel     = MyCustomLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureMotivationView()
    }
    
    
    private func configureMotivationView(){
        
        view.addSubview(motivationImage)
        view.addSubview(motivationTitle)
        
        view.backgroundColor      = UIColor(red: 79.0/255, green: 189.0/255, blue: 186.0/255, alpha: 1.0)
        view.layer.cornerRadius   = 10
        
        
        motivationImage.translatesAutoresizingMaskIntoConstraints   = false
        
        motivationTitle.text          = "Günün Sözü"
        motivationImage.image         = UIImage(named: "Layer1")
        motivationImage.contentMode   = .scaleAspectFit
             
        NSLayoutConstraint.activate([
            motivationImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            motivationImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            motivationImage.heightAnchor.constraint(equalTo: motivationImage.widthAnchor),
            motivationImage.widthAnchor.constraint(equalToConstant: 90),
            
            motivationTitle.centerYAnchor.constraint(equalTo: motivationImage.centerYAnchor),
            motivationTitle.leadingAnchor.constraint(equalTo: motivationImage.trailingAnchor),
            motivationTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            motivationTitle.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
