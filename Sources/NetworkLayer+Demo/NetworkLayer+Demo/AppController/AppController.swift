//
//  AppController.swift
//  NetworkLayer+Demo
//
//  Created by Tal talspektor on 18/08/2021.
//

import UIKit
import NetworkLayer

final class AppController {
    
    /// Instatiate the component
    /// - Returns: The component's viewController
    func getComponentViewController() -> UIViewController {
        let router = Router<TeamsEndPoint>()
        let dataProvoder = NetworkTeamsDataProvider(router: router)
        let viewModel = ViewModel(dataProvoder: dataProvoder)
        
        return ViewController(with: viewModel)
    }
}
