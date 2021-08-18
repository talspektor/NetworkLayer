//
//  ViewController.swift
//  NetworkLayer+Demo
//
//  Created by Tal talspektor on 17/08/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel: ViewModel?
    
    convenience init(with viewModel: ViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.fetchFrenchLegue()
        
        viewModel?.fetchSpanishLegue()
        
        viewModel?.fetchEnglishLegue()
    }


}

