//
//  Coordinator.swift
//  MVVM+Coordinator
//
//  Created by Victor on 27.02.2023.
//

import UIKit

protocol Coordinator {
    
    var navigationController : UINavigationController { get set }
    
    func start()
}
