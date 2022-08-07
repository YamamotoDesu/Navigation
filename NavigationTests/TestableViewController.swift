//
//  TestableViewController.swift
//  NavigationTests
//
//  Created by 山本響 on 2022/08/07.
//

@testable import Navigation
import UIKit
// We can't use this for a view controller that comes from a stroyboard
class TestableViewController: ViewController {
    var presentCallCount = 0
    var presentArgsViewController: [UIViewController] = []
    var presentArgsAnimated: [Bool] = []


}
