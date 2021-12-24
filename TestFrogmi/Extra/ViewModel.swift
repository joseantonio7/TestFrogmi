//
//  ViewModel.swift
//  TestFrogmi
//
//  Created by José Antonio Aravena on 23-12-21.
//

import Combine
import Foundation

protocol ViewModel: ObservableObject where ObjectWillChangePublisher.Output == Void {
    associatedtype State
    associatedtype Input
    var state: State { get }
    func trigger(_ input: Input)
    func next()
}

extension AnyViewModel: Identifiable where State: Identifiable {
    var id: State.ID {
        state.id
    }
}

@dynamicMemberLookup
final class AnyViewModel<State, Input>: ViewModel {

    private let wrappedObjectWillChange: () -> AnyPublisher<Void, Never>
    private let wrappedState: () -> State
    private let wrappedTrigger: (Input) -> Void
    private let wrappedNext: () -> Void

    var objectWillChange: AnyPublisher<Void, Never> {
        wrappedObjectWillChange()
    }

    var state: State {
        wrappedState()
    }

    func trigger(_ input: Input) {
        wrappedTrigger(input)
    }

    func next() {
        wrappedNext()
    }

    subscript<Value>(dynamicMember keyPath: KeyPath<State, Value>) -> Value {
        state[keyPath: keyPath]
    }

    init<V: ViewModel>(_ viewModel: V) where V.State == State, V.Input == Input {
        self.wrappedObjectWillChange = { viewModel.objectWillChange.eraseToAnyPublisher() }
        self.wrappedState = { viewModel.state }
        self.wrappedTrigger = viewModel.trigger
        self.wrappedNext = viewModel.next
    }
}
