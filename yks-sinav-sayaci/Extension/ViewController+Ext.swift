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
    
    // target date
    func targetDate() -> Date{
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
    
//    func showAlert(title: String, message: String){
//        let alertControl = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        
//        present(alertControl, animated: true) {
//            self.dismiss(animated: true)
//        }
//    }
    
    

}
