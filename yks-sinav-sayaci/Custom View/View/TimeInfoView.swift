//
//  TimeInfoView.swift
//  yks-sinav-sayaci
//
//  Created by Muhammed Faruk Söğüt on 22.01.2022.
//

import UIKit

enum InfoType {
    case day,hour,minute,second
}

class TimeInfoView: UIView {

    let timeLabel   = MyCustomLabel(size: 28, color: .black)
    let infoLabel   = MyCustomLabel(size: 24, color: .black)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set (infoType: InfoType, number:Int){
        switch infoType {
        case .day:
            timeLabel.text = "\(number)"
            infoLabel.text = "Gün"            
        case .hour:
            timeLabel.text = "\(number)"
            infoLabel.text = "Saat"
        case .minute:
            timeLabel.text = "\(number)"
            infoLabel.text = "Dakika"
        case .second:
            timeLabel.text = "\(number)"
            infoLabel.text = "Saniye"
        }
       
        print("view set")
    }
    
    private func configure() {
        backgroundColor     = .white
        layer.cornerRadius  = 10
        clipsToBounds       = true

        addSubview(timeLabel)
        addSubview(infoLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            self.widthAnchor.constraint(equalToConstant: 80),
                        
            timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            timeLabel.heightAnchor.constraint(equalToConstant: 32),
            
            infoLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 5),
            infoLabel.centerXAnchor.constraint(equalTo: timeLabel.centerXAnchor),
            infoLabel.widthAnchor.constraint(equalTo: timeLabel.widthAnchor),
            infoLabel.heightAnchor.constraint(equalToConstant: 28)
            
        ])
        
    }

}
