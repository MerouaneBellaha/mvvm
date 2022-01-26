//
//  Helpers.swift
//  MVVM
//
//  Created by Merouane Bellaha on 26/01/2022.
//

import Foundation

class Observable<T> {
    
    var value: T? {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T?) {
        self.value = value
    }

    private var listener: ((T?) -> ())?

    func bind(listener: @escaping (T?) -> ()) {
        listener(value)
        self.listener = listener
    }
}
