//
//  Updatestore.swift
//  UI设计
//
//  Created by 之后. on 2021/6/5.
//

import SwiftUI

import Combine


class Updatestore:ObservableObject {
    var didChange = PassthroughSubject<Void, Never>()
      var updates:[Update] {
        didSet{
            didChange.send()
        }
    }
    
    init(updates: [Update] = []) {
        self.updates = updates
    }
}
