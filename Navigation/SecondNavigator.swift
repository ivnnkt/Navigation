//
//  SecondNavigator.swift
//  Navigation
//
//  Created by Nikita on 16.08.2022.
//

import UIKit

class SecondNavigator {
    private let navigationController: UINavigationController
    
    init() {
        let rootVC = UIStoryboard.viewControllerById(Destination.vc21.rawValue)
        navigationController = UINavigationController(rootViewController: rootVC)
        if let vc = rootVC as? BasicSecondController {
            vc.navigator = self
        }
    }
}

extension SecondNavigator: BasicNavigation {
    func initialViewController() -> UIViewController {
        return navigationController
    }
}

extension SecondNavigator: Navigator {
    enum Destination: String {
        case vc21 = "2.1"
        case vc22 = "2.2"
        case vc23 = "2.3"
    }
    
    func show(_ destinition: SecondNavigator.Destination) {
        let destinationVC = UIStoryboard.viewControllerById(destinition.rawValue)
        navigationController.pushViewController(destinationVC, animated: true)
        
        if let vc = destinationVC as? BasicSecondController {
            vc.navigator = self
        }
    }
}
