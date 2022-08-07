# Navigation
iOS Unit Testing by Example - Chapter 10

![image](https://user-images.githubusercontent.com/47273077/178744829-44543765-d038-4d50-938d-7fb790badb98.png)

## TestHelper
TestHelpers.swift
```swift
import UIKit

func tap(_ button: UIButton) {
    button.sendActions(for: .touchUpInside)
}

func executeRunLoop() {
    RunLoop.current.run(until: Date())
}
```

## Code-Based Push Navigation
ViewControllerTests.swift
```swift
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
```
