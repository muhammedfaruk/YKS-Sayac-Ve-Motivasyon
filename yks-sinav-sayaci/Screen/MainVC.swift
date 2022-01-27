//
//  MainVC.swift
//  yks-sinav-sayaci
//
//  Created by Muhammed Faruk Söğüt on 20.01.2022.
//

import UIKit


class MainVC: UIViewController {
        
    let headerContainerView     = UIView()
    let motivationContainerView = UIView()
    let bacgroundImage          = UIImageView()
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBacgroundImage()
        configureLayout()
        configureHeaderView()
        configureMotivationView()
    }

    
    private func configureBacgroundImage(){
        navigationController?.navigationBar.barStyle    = .black
        navigationController?.navigationBar.tintColor   = .white
        bacgroundImage.image = UIImage(named:"dark")
        view.addSubview(bacgroundImage)
        view.sendSubviewToBack(bacgroundImage)
        bacgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bacgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            bacgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bacgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bacgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    func configureLayout(){
        DispatchQueue.main.async {
            let timeHeaderVC = TimeHeaderVC()
            self.add(childVC: timeHeaderVC, containerView: self.headerContainerView)
            let motivationVC = MotivationVC()
            self.add(childVC: motivationVC, containerView: self.motivationContainerView)
        }
    }
    
    
    private func configureHeaderView(){
        view.addSubview(headerContainerView)
                
        headerContainerView.translatesAutoresizingMaskIntoConstraints = false    
        NSLayoutConstraint.activate([
            headerContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            headerContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            headerContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            headerContainerView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    
    private func configureMotivationView(){
        view.addSubview(motivationContainerView)
                
        motivationContainerView.translatesAutoresizingMaskIntoConstraints = false
                        
        let height:CGFloat = DeviceTypes.isiPhone8Zoomed || DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Standard ?  300 : 350
        
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
    
}


