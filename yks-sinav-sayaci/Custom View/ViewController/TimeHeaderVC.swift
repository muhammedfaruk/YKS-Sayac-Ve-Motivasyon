//
//  TimeHeaderVC.swift
//  yks-sinav-sayaci
//
//  Created by Muhammed Faruk Söğüt on 22.01.2022.
//

import UIKit

class TimeHeaderVC: UIViewController{
    
    let stackView           = UIStackView()
    let titleLabel          = MyCustomLabel(size: 36,color: .white)
    let timeItemOne         = TimeInfoView()
    let timeItemTwo         = TimeInfoView()
    let timeItemThree       = TimeInfoView()
    let timeItemFour        = TimeInfoView()
           
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let mainVC = MainVC()
        mainVC.delegate = self
        
        
        configureStackView()
        configureHeaderView()
    }
    
    
    private func configureStackView(){
        
        stackView.distribution  = .equalSpacing
        stackView.axis          = .horizontal
        stackView.addArrangedSubview(timeItemOne)
        stackView.addArrangedSubview(timeItemTwo)
        stackView.addArrangedSubview(timeItemThree)
        stackView.addArrangedSubview(timeItemFour)
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func configureHeaderView(){
        
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        
        titleLabel.text           = "YKS 2022"
        
        view.backgroundColor      = UIColor(red: 53.0/255, green: 133.0/255, blue: 139.0/255, alpha: 1)
        view.layer.cornerRadius   = 10
             
        NSLayoutConstraint.activate([         
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
                                 
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            stackView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    
    func showRemainderTime(day:Int,hour:Int,minute:Int,second:Int) {
        
        if day != 0 && hour != 0 && minute != 0 && second != 0 {
            
            timeItemOne.set(infoType: .day, number: day)
            timeItemTwo.set(infoType: .hour, number: hour)
            timeItemThree.set(infoType: .minute, number: minute)
            timeItemFour.set(infoType: .second, number: second)
           
        }else {
            // exam time :D
            
            
        }
        print("deneme")
    }
    

}

extension TimeHeaderVC : MainVCDelegate {
    func getTime(string:String) {
        print("tiemheader deneme")
        print(string)
    }
}

