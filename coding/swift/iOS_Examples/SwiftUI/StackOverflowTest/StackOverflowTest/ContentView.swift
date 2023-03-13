//
//  ContentView.swift
//  StackOverflowTest
//
//  Created by 문철현 on 2023/03/13.
//

import SwiftUI

class Model: ObservableObject {
    
    let coordinateSpace = "CoordinateSpace"
    
    @Published var isDragged = false
    @Published var highlightedNumber: Int? = nil
    @Published var selectedNumber: Int? = nil
    
    /// Frames for individual picker items (from their respective `GeometryReader`).
    private var framesForNumbers: [Int: CGRect] = [:]
    
    func update(frame: CGRect, for number: Int) {
        framesForNumbers[number] = frame
    }
    
    /// Updates `highlightedNumber` according drag location.
    func update(dragLocation: CGPoint) {
        
        // Lookup if any frame contains drag location.
        for (eachNumber, eachFrame) in framesForNumbers {
            if eachFrame.contains(dragLocation) {
                
                // Publish.
                self.highlightedNumber = eachNumber
                return
            }
        }
        
        // Reset otherwise.
        self.highlightedNumber = nil
    }
    
    /// Updates `highlightedNumber` and `selectedNumber` according drop location.
    func update(isDragged: Bool) {
        
        // Publish.
        self.isDragged = isDragged
        
        if isDragged == false,
           let highlightedNumber = self.highlightedNumber {
            
            // Publish.
            self.selectedNumber = highlightedNumber
            self.highlightedNumber = nil
        }
    }
}

struct ContentView: View {
    
    @StateObject var model = Model()
    
    var body: some View {
        ZStack {
            TouchesView(model: model, isDragged: $model.isDragged)
            CanvasView(number: $model.selectedNumber)
                .allowsHitTesting(false)
            PickerView(model: model, highlightedNumber: $model.highlightedNumber)
                .allowsHitTesting(false)
        }
        .ignoresSafeArea()
    }
}

/// Handles drag interactions and updates model accordingly.
struct TouchesView: View {
    
    var model: Model
    @Binding var isDragged: Bool
    
    var body: some View {
        Rectangle()
            .foregroundColor(isDragged ? .orange : .yellow)
            .coordinateSpace(name: model.coordinateSpace)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        model.update(dragLocation: value.location)
                        model.update(isDragged: true)
                    }
                    .onEnded { state in
                        model.update(dragLocation: state.location)
                        model.update(isDragged: false)
                    }
                )
    }
}

/// Shows the selected number.
struct CanvasView: View {
    
    @Binding var number: Int?
    
    var body: some View {
        VStack {
            Text(number.string)
                .font(.system(size: 100, weight: .bold))
                .foregroundColor(.white)
                .offset(y: -50)
        }
    }
}

/// Displays a picker to select number items from.
struct PickerView: View {
    
    var model: Model
    @Binding var highlightedNumber: Int?
    
    var body: some View {
        HStack(spacing: 5) {
            PickerItemView(number: 1, model: model, highlightedNumber: $highlightedNumber)
            PickerItemView(number: 2, model: model, highlightedNumber: $highlightedNumber)
            PickerItemView(number: 3, model: model, highlightedNumber: $highlightedNumber)
        }
        .opacity(model.isDragged ? 1 : 0)
        .scaleEffect(model.isDragged ? 1 : 0.5, anchor: .top)
        .blur(radius: model.isDragged ? 0 : 10)
        .animation(.spring(response: 0.15, dampingFraction: 0.4, blendDuration: 0.5))
    }
}

/// Shows a number item (also highlights it when `highlightedNumber` matches).
struct PickerItemView: View {
    
    let number: Int
    var model: Model
    @Binding var highlightedNumber: Int?
    
    var body: some View {
        Text(String(number))
            .font(.system(size: 25, weight: .bold))
            .foregroundColor(isHighlighted ? .orange : .white)
            .frame(width: 50, height: 50)
            .background(isHighlighted ? Color.white : Color.orange)
            .cornerRadius(25)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white, lineWidth: 2)
            )
            .overlay(GeometryReader { geometry -> Color  in
                self.model.update(
                    frame: geometry.frame(in: .named(self.model.coordinateSpace)),
                    for: self.number
                )
                return Color.clear
            })
            .animation(.none)
    }
}

extension PickerItemView {
    
    var isHighlighted: Bool {
        self.highlightedNumber == self.number
    }
}

fileprivate extension Optional where Wrapped == Int {
    
    var string: String {
        if let number = self {
            return String(number)
        } else {
            return ""
        }
    }
}

struct PrototypeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
