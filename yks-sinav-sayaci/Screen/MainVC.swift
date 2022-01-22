//
//  MainVC.swift
//  yks-sinav-sayaci
//
//  Created by Muhammed Faruk Söğüt on 20.01.2022.
//

import UIKit

protocol MainVCDelegate: AnyObject{
    func getTime(string: String)
}

class MainVC: UIViewController {
        
    let headerContainerView     = UIView()
    let motivationContainerView = UIView()

    var quoteTexts  = [Quote]()
    
    var delegate : MainVCDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureLayout()
        configureHeaderView()
        configureMotivationView()
        getQuoteTexts()
        configureTimer()
        delegate?.getTime(string: "timeeeeeee")
    }
    
    func configureLayout(){
        DispatchQueue.main.async {
            let timeHeaderVC = UINavigationController(rootViewController: TimeHeaderVC())
            self.add(childVC: timeHeaderVC, containerView: self.headerContainerView)
            let motivationVC = MotivationVC()
            self.add(childVC: motivationVC, containerView: self.motivationContainerView)
        }
    }
    
    private func configureHeaderView(){
        view.addSubview(headerContainerView)
                
        headerContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            headerContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            headerContainerView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    
    private func configureMotivationView(){
        view.addSubview(motivationContainerView)
        
        motivationContainerView.backgroundColor      = UIColor(red: 79.0/255, green: 189.0/255, blue: 186.0/255, alpha: 1.0)
        motivationContainerView.layer.cornerRadius   = 10
        
        motivationContainerView.translatesAutoresizingMaskIntoConstraints    = false
       
        let height:CGFloat = DeviceTypes.isiPhone8Zoomed || DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Standard ?  300 : 400
        
        NSLayoutConstraint.activate([
            motivationContainerView.topAnchor.constraint(equalTo: headerContainerView.bottomAnchor, constant: 25),
            motivationContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            motivationContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            motivationContainerView.heightAnchor.constraint(equalToConstant: height),
        ])
    }
    
    func add(childVC : UIViewController, containerView: UIView){
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
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
        
        //delegate?.getTime(day: result.RemainderDay, hour: result.RemainderHour, minute: result.RemainderMinute, second: result.RemainderSecond)
    }
    
    
    private func showRemainderTime(day:Int,hour:Int,minute:Int,second:Int) {
       //let TimeHeader = TimeHeaderVC()
       // TimeHeader.showRemainderTime(day: day, hour: hour, minute: minute, second: second)
       //delegate?.getTime(day: day, hour: hour, minute: minute, second: second)
               

    }
    
    
    private func getQuoteTexts(){
        GetLocalData.shared.parse { result in
            switch result {
            case .success(let quoteTextsArray):
                self.quoteTexts = quoteTextsArray
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
    
}


