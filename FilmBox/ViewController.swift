//
//  ViewController.swift
//  FilmBox
//
//  Created by Ahmed Ali on 30/06/2022.
//

import UIKit

class ViewController: UIViewController {

    let viewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.viewDidLoad()
    }
}
