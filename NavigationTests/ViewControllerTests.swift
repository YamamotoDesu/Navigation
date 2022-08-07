//
//  ViewControllerTests.swift
//  NavigationTests
//
//  Created by 山本響 on 2022/08/06.
//

@testable import Navigation
import XCTest

class ViewControllerTests: XCTestCase {

    func test_tappingCodePushButton_shouldPushCodeNextViewControoller() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()

        
        let navigation = UINavigationController(rootViewController: sut)
        tap(sut.codePushButton)
        
        executeRunLoop()
        
        XCTAssertNotNil(sut.navigationController)
        
        let pushedVC = navigation.viewControllers.last
        XCTAssertEqual(navigation.viewControllers.count, 2, "navigation stack")
        XCTAssertTrue(pushedVC is CodeNextViewController,
                      "Expected CodeNextViewController, " + "but was \(String(describing: pushedVC))" )
        
    }
    
    func test_tappingCodePushButton_shouldPushCodeNextViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        sut.loadViewIfNeeded()
        
        let navigation = UINavigationController(rootViewController: sut)
        
        tap(sut.codePushButton)
        
        executeRunLoop()
        XCTAssertEqual(navigation.viewControllers.count, 2, "navtigation stack")
        
        let pushedVC = navigation.viewControllers.last
        guard let codeNextVC = pushedVC as? CodeNextViewController else {
            XCTFail("Expected CodeNextViewController, "
            + "but was \(String(describing: pushedVC))")
            return
        }
        XCTAssertEqual(codeNextVC.label.text, "Pushed from code")
    }
}

