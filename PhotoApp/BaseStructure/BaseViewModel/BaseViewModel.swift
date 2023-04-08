//
//  BaseViewModel.swift
//  SwiftUIStructure
//
//  Created by Bakr mohamed on 20/03/2023.
//

import SwiftUI
import Combine

public protocol BaseViewModelProtocol: ObservableObject{
    
    associatedtype State
    associatedtype Action
    
    var state: State { get set }
    func trigger(_ action: Action)
}

open class BaseViewModel<State, Action>: BaseViewModelProtocol {
    @Published public var state: State
    
    public init(state: State) {
        self.state = state
    }
    
    open func trigger(_ action: Action) {
        DispatchQueue.main.async {
            // Should be override by child class
        }
    }
    
    // Override the objectWillChange publisher to ensure it's published on the main thread
       public var objectWillChange: AnyPublisher<Void, Never> {
           $state
               .receive(on: RunLoop.main)
               .map { _ in }
               .eraseToAnyPublisher()
       }
}
