//
//  TimeHeaderVC.swift
//  yks-sinav-sayaci
//
//  Created by Muhammed Faruk Söğüt on 22.01.2022.
//

import UIKit

class TimeHeaderVC: UIViewController{
    
    let stackView           = UIStackView()
    let titleLabel          = MyCustomLabel(fonte: .ArialRoundedBold, size: 36,color: .white)
    let timeItemOne         = TimeInfoView()
    let timeItemTwo         = TimeInfoView()
    let timeItemThree       = TimeInfoView()
    let timeItemFour        = TimeInfoView()
           
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTimer()
        configureStackView()
        configureHeaderView()
        
        
        let blur = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: blur)
        view.addSubview(blurView)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        blurView.layer.cornerRadius = 10
        blurView.layer.masksToBounds = true
        view.addSubview(blurView)
        view.sendSubviewToBack(blurView)
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
    private func configureTimer(){
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(calculateRemainderDate), userInfo: nil, repeats: true)
    }
    
    // target date
    private func targetDate() -> Date{
        var dateComponents      = DateComponents()
        dateComponents.year     = 2022
        dateComponents.month    = 06
        dateComponents.day      = 18
        dateComponents.timeZone = TimeZone(abbreviation: "tr")
        dateComponents.hour     = 10
        dateComponents.minute   = 15
        dateComponents.second   = 00

        // converted DateComponents to Date
        let userCalendar    = Calendar(identifier: .gregorian)
        let updatedDate     = userCalendar.date(from: dateComponents)
        
        return updatedDate ?? Date()
    }
    
    //Calculate remainder time to target
    @objc private func calculateRemainderDate(){
      
        let interval        = targetDate() - Date()
      
        let remainderDay    = interval.day
        
        let remainderHour   = interval.hour
        let remainderMinute = interval.minute
        let remainderSecond = interval.second
        
        let result = calculateRemainderTime(day: remainderDay!, hour: remainderHour!, minute: remainderMinute!, second: remainderSecond!)
        
        showRemainderTime(day: result.RemainderDay, hour: result.RemainderHour, minute: result.RemainderMinute, second: result.RemainderSecond)
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
    }
}


