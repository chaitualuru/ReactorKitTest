//
//  TestReactor.swift
//  TestProject
//
//  Created by Krishna C Aluru on 11/29/17.
//  Copyright © 2017 Krishna C Aluru. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift

final class TestReactor: Reactor {
    
    var initialState: State = State()
    
    struct State {
        
    }
    
    enum Action {
        
    }
    
    enum Mutation {
        
    }
    
    func mutate(action: TestReactor.Action) -> Observable<TestReactor.Mutation> {
        return .empty()
    }
    
    func reduce(state: TestReactor.State, mutation: TestReactor.Mutation) -> TestReactor.State {
        return state
    }
}
