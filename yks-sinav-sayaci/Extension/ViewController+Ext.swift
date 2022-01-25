//
//  Time.swift
//  yks-sinav-sayaci
//
//  Created by Muhammed Faruk Söğüt on 20.01.2022.
//

import Foundation
import UIKit

extension UIViewController{
    func calculateRemainderTime(day:Int, hour:Int, minute:Int, second:Int) -> (RemainderDay:Int, RemainderHour:Int, RemainderMinute:Int,RemainderSecond:Int){
        
        let realDay         = day
        
        //calculate remainder real hour
        let convertedHour   = day * 24
        let realHour        =  hour - convertedHour

        //calculate remainder real minute
        let convertedMinute = (convertedHour * 60) + (realHour * 60)
        let realMinute      = minute - convertedMinute

        //calculate remainder real second
        let convertedSecond = (convertedMinute * 60) + (realMinute * 60)
        let realSecond      =  second - convertedSecond

        return (realDay,realHour,realMinute,realSecond)
    }
    
    func showAlert(title: String, message: String){
        let alertControl = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        present(alertControl, animated: true) {
            self.dismiss(animated: true)
        }
    }

}
