//
//  MainVC.swift
//  yks-sinav-sayaci
//
//  Created by Muhammed Faruk Söğüt on 20.01.2022.
//

import UIKit


let headerView          = UIView()
let stackView           = UIStackView()
let titleLabel          = MyCustomLabel(size: 36,color: .white)
let timeItemOne         = TimeInfoView()
let timeItemTwo         = TimeInfoView()
let timeItemThree       = TimeInfoView()
let timeItemFour        = TimeInfoView()

let motivationView      = UIView()
let motivationImage     = UIImageView()
let motivationTitle     = MyCustomLabel(size: 46,color: .white)
let motivationLabel     = MyCustomLabel()

var quoteTexts          = [Quote]()

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
     
        configureHeaderView()
        configureStackView()
        configureMotivationView()
        getQuoteTexts()
        configureTimer()
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
        
        view.addSubview(headerView)
        headerView.addSubview(stackView)
        headerView.addSubview(titleLabel)
        
        titleLabel.text                 = "YKS 2022"
        
        headerView.backgroundColor      = UIColor(red: 53.0/255, green: 133.0/255, blue: 139.0/255, alpha: 1)
        
        headerView.layer.cornerRadius   = 10
        headerView.translatesAutoresizingMaskIntoConstraints = false
             
        NSLayoutConstraint.activate([
         
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            headerView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
                                 
            stackView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -12),
            stackView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    
    private func configureMotivationView(){
        view.addSubview(motivationView)
        motivationView.addSubview(motivationTitle)
        motivationView.addSubview(motivationImage)
        
        motivationView.backgroundColor      = UIColor(red: 79.0/255, green: 189.0/255, blue: 186.0/255, alpha: 1.0)
        motivationView.layer.cornerRadius   = 10
        
        motivationView.translatesAutoresizingMaskIntoConstraints    = false
        motivationImage.translatesAutoresizingMaskIntoConstraints   = false
        
        motivationTitle.text          = "Günün Sözü"
        motivationImage.image         = UIImage(named: "Layer1")
        motivationImage.contentMode   = .scaleAspectFit
        
        let height:CGFloat = DeviceTypes.isiPhone8Zoomed || DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Standard ?  300 : 400
        
        NSLayoutConstraint.activate([
            motivationView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 25),
            motivationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            motivationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            motivationView.heightAnchor.constraint(equalToConstant: height),
            
            motivationImage.topAnchor.constraint(equalTo: motivationView.topAnchor, constant: 10),
            motivationImage.leadingAnchor.constraint(equalTo: motivationView.leadingAnchor, constant: 12),
            motivationImage.heightAnchor.constraint(equalTo: motivationImage.widthAnchor),
            motivationImage.widthAnchor.constraint(equalToConstant: 90),
            
            motivationTitle.centerYAnchor.constraint(equalTo: motivationImage.centerYAnchor),
            motivationTitle.leadingAnchor.constraint(equalTo: motivationImage.trailingAnchor),
            motivationTitle.trailingAnchor.constraint(equalTo: motivationView.trailingAnchor, constant: -20),
            motivationTitle.heightAnchor.constraint(equalToConstant: 50)
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
    
    
    private func showRemainderTime(day:Int,hour:Int,minute:Int,second:Int) {
        if day != 0 && hour != 0 && minute != 0 && second != 0 {
            timeItemOne.set(infoType: .day, number: day)
            timeItemTwo.set(infoType: .hour, number: hour)
            timeItemThree.set(infoType: .minute, number: minute)
            timeItemFour.set(infoType: .second, number: second)
        }else {
            // exam time :D
            
            
        }
    }
    
    
    private func getQuoteTexts(){
        GetLocalData.shared.parse { result in
            switch result {
            case .success(let quoteTextsArray):
                quoteTexts = quoteTextsArray
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
    
}
