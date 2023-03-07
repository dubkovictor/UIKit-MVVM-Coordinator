//
//  FirstViewController.swift
//  MVVM+Coordinator
//
//  Created by Victor on 27.02.2023.
//

import UIKit

class FirstViewController: UIViewController {
    weak var coordinator: AppCoordinator?
    var viewModel: FirstViewModel?
    
    @IBOutlet var loginField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var statusLbl: UILabel!
    @IBAction func login(_ sender: Any) {
        viewModel?.userButtonPressed(login: loginField.text ?? "", password: passwordField.text ?? "")
        if viewModel?.isLoggedIn == true {
            coordinator?.isLoggedIn = viewModel?.isLoggedIn ?? false
            coordinator?.openSecondVC(login: loginField.text ?? "")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialState()
        bindViewModel()
    }
    
    func initialState() {
        statusLbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        statusLbl.text = ""
    }
    
    func bindViewModel() {
        viewModel?.statusText.bind({ (statusText) in
            //DispatchQueue.main.async {
                self.statusLbl.text = statusText
            //}
        })
        viewModel?.statusColor.bind({(statusColor) in
            //DispatchQueue.main.async {
                self.statusLbl.textColor = statusColor
            //}
        })
    }
}
