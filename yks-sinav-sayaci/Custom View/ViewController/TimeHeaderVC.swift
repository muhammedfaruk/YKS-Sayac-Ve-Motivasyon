//
//  TimeHeaderVC.swift
//  yks-sinav-sayaci
//
//  Created by Muhammed Faruk Söğüt on 22.01.2022.
//

import UIKit

class TimeHeaderVC: UIViewController{
    
    let stackView          = UIStackView()
    let titleLabel          = MyCustomLabel(fonte: .ArialRoundedBold, size: 36,color: .white)

    let dayLabel            = MyCustomLabel(fonte: .ArialRoundedBold, size: 26, color: .white)
    let hourLabel           = MyCustomLabel(fonte: .ArialRoundedBold, size: 26, color: .white)
    let minuteLabel         = MyCustomLabel(fonte: .ArialRoundedBold, size: 26, color: .white)
    let secondLabel         = MyCustomLabel(fonte: .ArialRoundedBold, size: 26, color: .white)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBlurView()
        configureLabels()
        configureHeaderView()
        configureTimer()
    }
    
    
    private func configureBlurView(){
        let blur                        = UIBlurEffect(style: .regular)
        let blurView                    = UIVisualEffectView(effect: blur)
        view.addSubview(blurView)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.layer.cornerRadius     = 10
        blurView.layer.masksToBounds    = true
   
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    private func configureLabels(){
        
        let timeViewArray = [dayLabel,hourLabel,minuteLabel,secondLabel]
  
        for timeView in timeViewArray {
            view.addSubview(timeView)
            timeView.backgroundColor     = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
            timeView.layer.cornerRadius  = 15
            timeView.clipsToBounds       = true
           
            NSLayoutConstraint.activate([
                timeView.widthAnchor.constraint(equalToConstant: 80),
            ])
        }
    }
    
    
    private func configureHeaderView(){
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        
        titleLabel.text           = "YKS 2022"
        
        stackView.distribution  = .equalSpacing
        stackView.axis          = .horizontal
        stackView.addArrangedSubview(dayLabel)
        stackView.addArrangedSubview(hourLabel)
        stackView.addArrangedSubview(minuteLabel)
        stackView.addArrangedSubview(secondLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalToConstant: 90),
  
        ])
    }
    
    
    
    // MARK : calculating time
    
    private func configureTimer(){
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(calculateRemainderDate), userInfo: nil, repeats: true)
    }
    
    @objc func calculateRemainderDate(){
        
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
            dayLabel.text = "\(day)\nGün"
            hourLabel.text = "\(hour)\nSaat"
            minuteLabel.text = "\(minute)\nDakika"
            secondLabel.text = "\(second)\nSaniye"
        }
    }
    
    
}


