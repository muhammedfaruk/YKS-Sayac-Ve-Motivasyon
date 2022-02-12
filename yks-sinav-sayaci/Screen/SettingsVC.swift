//
//  SettingsVC.swift
//  yks-sinav-sayaci
//
//  Created by Muhammed Faruk Söğüt on 22.01.2022.
//

import UIKit
import StoreKit

class SettingsVC: UIViewController {
    
    var tableView : UITableView!
    
    
    let developerCell : UITableViewCell = {
        let cell = UITableViewCell()
        cell.backgroundColor = .gray        
        cell.textLabel?.text = "🧑‍💻 Muhammed Faruk Söğüt"
        cell.textLabel?.textColor = .white
        return cell
    }()
    
    
    let feedBackCell : UITableViewCell = {
        let cell = UITableViewCell()
        cell.backgroundColor = .gray
        cell.textLabel?.text = "📝 Geri Bildirim Gönder"
        cell.textLabel?.textColor = .white
        return cell
    }()
    
    
    let reviewOnStoreCell : UITableViewCell = {
        let cell = UITableViewCell()
        cell.backgroundColor = .gray
        cell.textLabel?.text = "🌟 Uygulamayı Değerlendir"
        cell.textLabel?.textColor = .white
        return cell
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .black
        configureTableView()
    }

    
    private func configureTableView (){
        tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        view.addSubview(tableView)
        tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        
    }
  
    func mailtoMe(){
        let email = "muhammedfaruksogut0@gmail.com"
        if let url = URL(string: "mailto:\(email)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    func rateApp() {       
        guard let scene = view.window?.windowScene else {return}
        
        if #available(iOS 14.0, *) {
            SKStoreReviewController.requestReview(in: scene)
        } else {
            
        }
    }
        
  
}

extension SettingsVC : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
       if let headerView = view as? UITableViewHeaderFooterView {
           headerView.textLabel?.textColor = .white
       }
   }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0 :
            return "Uygulama Hakkında"
        case 1 :
            return "Geliştirici"
        default:
            fatalError()
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 2
        case 1:
            return 1
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0 :
            switch indexPath.row {
            case 0 :
                return feedBackCell
            case 1 :
                return reviewOnStoreCell
            default:
                fatalError()
            }
        case 1 :
            switch indexPath.row {
            case 0 :
                return developerCell
            default:
                fatalError()
            }
        default :
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 && indexPath.row == 0 {
           mailtoMe()
        } else if indexPath.section == 0 && indexPath.row == 1{
           rateApp()
        }
    }
    
}


