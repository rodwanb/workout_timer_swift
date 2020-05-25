//
//  WorkoutSessionView.swift
//  WorkoutTimer iOS
//
//  Created by Rodwan on 2020/05/25.
//

import SwiftUI

struct WorkoutSessionView<ViewModel>: View where ViewModel: WorkoutSessionViewModel {
    
    @ObservedObject var viewModel: ViewModel
    
//    init(_ viewModel: ViewModel) {
//        self.viewModel = viewModel
//    }
    
    var body: some View {
        return VStack {
            Text("Timer: \(viewModel.sessionName) - \(viewModel.remainingTime)")
            
            Button(action: {
                self.viewModel.startTimer()
            }, label: {
                Text("Start Timer")
            })
            
            Button(action: {
                self.viewModel.stopTimer()
            }, label: {
                Text("Stop Timer")
            })
            
            Button(action: {
                self.viewModel.restartTimer()
            }, label: {
                Text("Restart Timer")
            })
        }
    }
}

struct WorkoutSessionView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutSessionView(viewModel: PreviewWorkoutSessionViewModelImpl())
    }
    
    class PreviewWorkoutSessionViewModelImpl: WorkoutSessionViewModel {
        var sessionName: String = "Preview"
        
        var remainingTime: Int = 10
        
        func startTimer() {
            
        }
        
        func stopTimer() {
            
        }
        
        func restartTimer() {
            
        }

    }
}
