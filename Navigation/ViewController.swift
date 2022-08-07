//
//  ViewController.swift
//  Navigation
//
//  Created by 山本響 on 2022/08/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private(set) var codePushButton: UIButton!
    @IBOutlet private(set) var codeModalButton: UIButton!
    @IBOutlet private(set) var sequePushButton: UIButton!
    @IBOutlet private(set) var sequeModalButton: UIButton!

    @IBAction private func pushNextViewController() {
        let nextVC = CodeNextViewController(labelText: "Pushed from code")
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction private func presentModalViewController() {
        let nextVC = CodeNextViewController(labelText: "Modal from code")
        self.present(nextVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for seque: UIStoryboardSegue, sender: Any?) {
        switch seque.identifier {
        case "pushNext"?:
            guard let nextVC = seque.destination as? SequeNextViewController else {
                return
            }
            nextVC.labelText = "Pushed from seque"
        case "modalNext"?:
            guard let nextVC = seque.destination as? SequeNextViewController else {
                return
            }
            nextVC.labelText = "Modal from seque"
        default:
            return
        }
    }


}

