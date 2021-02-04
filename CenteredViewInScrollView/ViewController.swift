//
//  ViewController.swift
//  CenteredViewInScrollView
//
//  Created by Jose Correa on 02/02/21.
//

import UIKit

class ViewController: UIViewController {
    var myView: ViewControllerView!
    
    override func loadView() {
        myView = ViewControllerView()
        view = myView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    


}

