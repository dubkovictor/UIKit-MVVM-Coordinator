//
//  SecondViewController.swift
//  MVVM+Coordinator
//
//  Created by Victor on 27.02.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    weak var coordinator: AppCoordinator?
    var viewModel: SecondViewModel?
   
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBAction func goNext(_ sender: Any) {
        coordinator?.openThirdVC()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text = "Hi \(viewModel?.login ?? "")"
    }
}
