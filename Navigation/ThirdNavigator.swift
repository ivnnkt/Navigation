//
//  ThirdNavigator.swift
//  Navigation
//
//  Created by Nikita on 16.08.2022.
//

import UIKit

class ThirdNavigator {
    private var currentVC: UIViewController
    
    init() {
        currentVC = UIStoryboard.viewControllerById("3.1")
        
        if let vc = currentVC as? ThirdFlow {
            vc.navigator = self
        }
    }
}

extension ThirdNavigator: BasicNavigation {
    func initialViewController() -> UIViewController {
        return currentVC
    }
}

extension ThirdNavigator: BackNavigator {
    enum Destination: String {
        case vc31 = "3.1"
        case vc32 = "3.2"
        case vc33 = "3.3"
    }
    
    func show(_ destinition: ThirdNavigator.Destination) {
        let vc = UIStoryboard.viewControllerById(destinition.rawValue)
        if let vc = vc as? ThirdFlow {
            vc.navigator = self
        }
        currentVC.present(vc, animated: true) { [weak self] in
            self?.currentVC = vc
        }
    }
    
    func goBack() {
            if let parentVC = currentVC.presentingViewController {
                currentVC.dismiss(animated: true) { [weak self] in
                    self?.currentVC = parentVC
                }
            }
    }
}
