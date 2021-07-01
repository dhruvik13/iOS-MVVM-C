//
//  BaseViewController.swift
//  iOS-MVVM-C
//
//  Created by dhruvik.rao on 30/06/2021.
//

import UIKit

open class BaseViewController<T>: UIViewController {
    open var viewModel: T!

    open override func viewDidLoad() {
        super.viewDidLoad()
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

public extension BaseViewController {
    static func create(viewModelFactory: (UIViewController) -> T) -> Self {
        let className = String(describing: self)
        let storyboard = UIStoryboard(name: className, bundle: Bundle(for:
                                                                        Self.self))
        guard let vc = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("couldn't load \(className) as \(type(of: self))")
        }

        vc.viewModel = viewModelFactory(vc)

        return vc
    }
}

public func guaranteeMainThread(_ work: @escaping () -> Void) {
    if Thread.isMainThread {
        work()
    } else {
        DispatchQueue.main.async(execute: work)
    }
}
