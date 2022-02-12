//
//  MotivationVC.swift
//  yks-sinav-sayaci
//
//  Created by Muhammed Faruk Söğüt on 23.01.2022.
//

import UIKit
import NotificationCenter

class MotivationVC: UIViewController {
    
    let motivationImage     = UIImageView()
    let motivationTitle     = MyCustomLabel(fonte: .ArialRoundedBold, size: 44,color: .white)
    let motivationLabel     = MyCustomLabel(fonte: .ArialMT, size: 30 , color: .white)
    let shareButton         = MyCustomButton(systemImage: "square.and.arrow.up")
    let copyButton          = MyCustomButton(systemImage: "doc.on.doc")
    
    var quoteTexts  = [Quote]()
    var randomQuote : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getQuoteTexts()
        configureBlurView()
        configureMotivationView()
        sendNotfication()
    }
    
    
    private func configureBlurView(){
        let blur = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blur)
        view.addSubview(blurView)
        blurView.layer.cornerRadius = 10
        blurView.layer.masksToBounds = true
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        view.sendSubviewToBack(blurView)
    }
    
    
    private func configureMotivationView(){
        
        view.addSubview(motivationImage)
        view.addSubview(motivationTitle)
        view.addSubview(motivationLabel)
        view.addSubview(shareButton)
        view.addSubview(copyButton)

        motivationImage.translatesAutoresizingMaskIntoConstraints   = false
        
        motivationTitle.text          = "Motivasyon"
        
        motivationImage.image         = UIImage(named: "Layer1")
        motivationImage.contentMode   = .scaleAspectFit
        
        randomQuote                   = quoteTexts.randomElement()?.text
        motivationLabel.text          = randomQuote

        shareButton.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
        copyButton.addTarget(self, action: #selector(didTapCopyButton), for: .touchUpInside)
        NSLayoutConstraint.activate([
            motivationImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            motivationImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            motivationImage.heightAnchor.constraint(equalTo: motivationImage.widthAnchor),
            motivationImage.widthAnchor.constraint(equalToConstant: 60),
            
            motivationTitle.centerYAnchor.constraint(equalTo: motivationImage.centerYAnchor),
            motivationTitle.leadingAnchor.constraint(equalTo: motivationImage.trailingAnchor, constant: 10),
            motivationTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            motivationTitle.heightAnchor.constraint(equalToConstant: 48),
            
            motivationLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            motivationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:10),
            motivationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            motivationLabel.heightAnchor.constraint(equalToConstant: 150),
            
            copyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:-10),
            copyButton.heightAnchor.constraint(equalToConstant: 50),
            copyButton.widthAnchor.constraint(equalToConstant: 50),
            copyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            shareButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:-10),
            shareButton.heightAnchor.constraint(equalToConstant: 50),
            shareButton.widthAnchor.constraint(equalToConstant: 50),
            shareButton.trailingAnchor.constraint(equalTo: copyButton.leadingAnchor, constant: -10)
        ])
    }
    
    
    @objc func didTapShareButton() {
        // text to share
        let text = randomQuote ?? ""
        // set up activity view controller
        let textToShare = [text]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash

        self.present(activityViewController, animated: true, completion: nil)
    }
    
    
    @objc func didTapCopyButton() {
        UIPasteboard.general.string = randomQuote
        showAlert(title: "", message: "Kopyalandı")
    }
    
    
    private func getQuoteTexts(){
        GetLocalData.shared.parse {[weak self] result in
            guard let self = self else {return}
            
            switch result {
            case .success(let quoteTextsArray):
                self.quoteTexts = quoteTextsArray
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
    
    
    func sendNotfication(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let permission  = appDelegate.permissionControl
        
        guard permission == true else{return}
        
        let content     = UNMutableNotificationContent()
        content.title   = "Motivasyon"
        content.body    = randomQuote ?? "Yorulunca değil bitirince dur."
        content.sound   = UNNotificationSound.default
        
        var datComp     = DateComponents()
        datComp.hour    = 12
        datComp.minute  = 00
        
        let trigger     = UNCalendarNotificationTrigger(dateMatching: datComp, repeats: true)
        
        let notificationRequest = UNNotificationRequest(identifier: "yksbildirim", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(notificationRequest)
        
    }
    
}
