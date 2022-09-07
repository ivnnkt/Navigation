//
//  ViewControllers.swift
//  Navigation
//
//  Created by Nikita on 16.08.2022.
//

import UIKit

class ViewController1: UIViewController {
}

class BasicSecondController: UIViewController {
    weak var navigator: SecondNavigator?
}

class ViewController21: BasicSecondController {
    @IBAction func nextButton(_ sender: Any) {
        navigator?.show(.vc22)
    }
}

class ViewController22: BasicSecondController {
    @IBAction func nextButton(_ sender: Any) {
        navigator?.show(.vc23)
    }
}

class ViewController23: BasicSecondController {
}

class ThirdFlow: UIViewController {
    weak var navigator: ThirdNavigator?
}

class ViewController31: ThirdFlow {
    @IBAction func nextToVC32Button(_ sender: Any) {
        navigator?.show(.vc32)
    }
    @IBAction func nextToVC33Button(_ sender: Any) {
        navigator?.show(.vc33)
    }
}

class ViewController32: ThirdFlow {
    @IBAction func nextToVC33Button(_ sender: Any) {
        navigator?.show(.vc33)
    }
    @IBAction func backButton(_ sender: Any) {
        navigator?.goBack()
    }
}

class ViewController33: ThirdFlow {
    @IBAction func back(_ sender: Any) {
        navigator?.goBack()
    }
}
