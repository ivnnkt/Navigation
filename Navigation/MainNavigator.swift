//
//  MainNavigator.swift
//  Navigation
//
//  Created by Nikita on 16.08.2022.
//

import UIKit

protocol BasicNavigation {
    func initialViewController() -> UIViewController
}

protocol Navigator {
    associatedtype Destination
    
    func show(_ destinition: Destination)
}

protocol BackNavigator: Navigator {
    func goBack()
}

class MainNavigator {
    static let shared = MainNavigator()
    
    let tabBar: UITabBarController
    private var navigators: [BasicNavigation]
    
    init() {
        self.tabBar = UITabBarController()
        
        self.navigators = [
            SecondNavigator(),
            ThirdNavigator()
        ]
        
        var controllers = navigators.map({$0.initialViewController()})
        let firstVC = UIStoryboard.viewControllerById("1")
        controllers.insert(firstVC, at: 0)

        controllers.forEach { (controller) in
            let barItem = UITabBarItem(title: "Titel", image: nil, selectedImage: nil)
            controller.tabBarItem = barItem
        }
        
        tabBar.viewControllers = controllers
    }
}

extension UIStoryboard {
    static func viewControllerById(_ id: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: id)
    }
}
