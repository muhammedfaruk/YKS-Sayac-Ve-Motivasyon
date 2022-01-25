//
//  SettingsVC.swift
//  yks-sinav-sayaci
//
//  Created by Muhammed Faruk Söğüt on 22.01.2022.
//

import UIKit

class SettingsVC: UIViewController {
    
    var tableView : UITableView!
    
    
    let darkCell : UITableViewCell = {
        let cell = UITableViewCell()
        cell.textLabel?.text = "📱 Dark Mode"
        
        return cell
    }()
    
    
    let secondCell : UITableViewCell = {
        let cell = UITableViewCell()
        return cell
    }()
    
    
    let feedBackCell : UITableViewCell = {
        let cell = UITableViewCell()
        cell.textLabel?.text = "📝 Geri Bildirim Gönder"
        return cell
    }()
    
    
    let reviewOnStoreCell : UITableViewCell = {
        let cell = UITableViewCell()
        cell.textLabel?.text = "🌟 Uygulamayı Değerlendir"
        return cell
    }()
    
    
    let switchBtn : UISwitch = {
        let switchBtn = UISwitch()
        switchBtn.translatesAutoresizingMaskIntoConstraints = false
        switchBtn.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        return switchBtn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        configureTableView()
        configureCells()
        darkModeControl()
                
    }
    
    
    private func darkModeControl(){
        let object = UserDefaults.standard.bool(forKey: "SwitchState")
        
        switchBtn.isOn = object
        
        if object{
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .dark
            }
        }else {
            UIApplication.shared.windows.forEach {  window in
                window.overrideUserInterfaceStyle = .light
            }
        }
    }
    
    
    @objc func switchValueDidChange(_ sender: UISwitch!) {
        
        UserDefaults.standard.set(sender.isOn, forKey: "SwitchState")
        
        if (sender.isOn){
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .dark
            }
        }
        else{
            UIApplication.shared.windows.forEach {  window in
                window.overrideUserInterfaceStyle = .light
            }
        }
    }
    
    
    private func configureTableView (){
        tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    private func configureCells(){
        view.addSubview(darkCell)
        view.addSubview(secondCell)
        view.addSubview(feedBackCell)
        
        darkCell.addSubview(switchBtn)
        
        
        
        NSLayoutConstraint.activate([
            switchBtn.topAnchor.constraint(equalTo: darkCell.topAnchor, constant: 5),
            switchBtn.trailingAnchor.constraint(equalTo: darkCell.trailingAnchor, constant: -15),
            switchBtn.heightAnchor.constraint(equalToConstant: 50),
            switchBtn.widthAnchor.constraint(equalToConstant: 50)
            
        ])
        
    }
}

extension SettingsVC : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            switch indexPath.row{
            case 0:
                return darkCell
            default:
                fatalError()
            }
            
        case 1 :
            switch indexPath.row {
            case 0 :
                return feedBackCell
            case 1 :
                return reviewOnStoreCell
            default:
                fatalError()
            }
        default :
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 1 && indexPath.row == 0 {
            // geri bildirim butonu tiklandi
            let email = "muhammedfaruksogut0.com"
            if let url = URL(string: "mailto:\(email)") {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
            
        } else if indexPath.section == 1 && indexPath.row == 1{
            // uygulamayı değerlendir
            
        }
        
    }
    
}


