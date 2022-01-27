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

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set (infoType: InfoType, number:Int){
//        switch infoType {
//        case .day:
//            timeLabel.text = "\(number)"
//            infoLabel.text = "Gün"            
//        case .hour:
//            timeLabel.text = "\(number)"
//            infoLabel.text = "Saat"
//        case .minute:
//            timeLabel.text = "\(number)"
//            infoLabel.text = "Dakika"
//        case .second:
//            timeLabel.text = "\(number)"
//            infoLabel.text = "Saniye"
//        }
    }
    
    private func configure() {
      
        
    }
    
   
   
}
