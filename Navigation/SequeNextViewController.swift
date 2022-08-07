//
//  SequeNextViewController.swift
//  Navigation
//
//  Created by 山本響 on 2022/08/06.
//

import UIKit

class SequeNextViewController: UIViewController {
    var labelText: String?
    
    @IBOutlet private(set) var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText
    }
}

