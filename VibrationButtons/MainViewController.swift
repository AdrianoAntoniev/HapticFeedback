//
//  MainViewController.swift
//  VibrationButtons
//
//  Created by Adriano-R Vieira on 05/01/22.
//

import UIKit

class MainViewController: UIViewController {

    init(frame: CGRect) {
        super.init(nibName: nil, bundle: nil)

        view = MainView(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
