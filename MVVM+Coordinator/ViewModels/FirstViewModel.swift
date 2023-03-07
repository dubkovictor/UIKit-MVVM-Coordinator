//
//  FirstViewModel.swift
//  MVVM+Coordinator
//
//  Created by Victor on 27.02.2023.
//

import Foundation
import UIKit.UIColor

class FirstViewModel {
    var statusText = Dynamic("")
    var statusColor = Dynamic(UIColor(ciColor: .red))
    var isLoggedIn = false
    
    func userButtonPressed(login: String, password: String) {
        if login != User.logins[0].login || password != User.logins[0].passwords {
            statusText.value = "Log in failed."
            statusColor.value = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
            isLoggedIn = false
        } else {
            statusText.value = "You successfully logged in."
            statusColor.value = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            isLoggedIn = true
        }
    }
}
