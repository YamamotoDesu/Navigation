//
//  TestHelpers.swift
//  NavigationTests
//
//  Created by 山本響 on 2022/08/06.
//

import UIKit

func tap(_ button: UIButton) {
    button.sendActions(for: .touchUpInside)
}

func executeRunLoop() {
    RunLoop.current.run(until: Date())
}
