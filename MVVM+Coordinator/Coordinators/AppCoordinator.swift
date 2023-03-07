//
//  AppCoordinator.swift
//  MVVM+Coordinator
//
//  Created by Victor on 27.02.2023.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController : UINavigationController
    
    var isLoggedIn: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if isLoggedIn {
            openSecondVC(login: User.logins[0].login!)
        } else {
            openFirstVC()
        }
    }
    
    func openFirstVC() {
        let vc = AppStoryboard.firstViewController.viewController(vc: FirstViewController.self)
        vc.coordinator = self
        vc.viewModel = FirstViewModel()
        vc.viewModel?.isLoggedIn = isLoggedIn
        navigationController.pushViewController(vc, animated: false)
    }
    
    func openSecondVC(login: String) {
        let vc = AppStoryboard.secondViewController.viewController(vc: SecondViewController.self)
        vc.coordinator = self
        vc.viewModel = SecondViewModel()
        vc.viewModel?.login = login
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func openThirdVC() {
        let vc = AppStoryboard.thirdViewController.viewController(vc: ThirdViewController.self)
        vc.coordinator = self
        let viewModel = ThirdViewModel()
        vc.viewModel = viewModel
        vc.viewModel?.userData = UserData.userData
        navigationController.pushViewController(vc, animated: true)
    }
}
