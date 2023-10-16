//  RadioButton.swift
//  Onbom
//  Created by 금가경 on 2023/10/10.
//

import SwiftUI

enum RadioButtonStyle {
    case oneUnselected
    case oneSelected
    case twoUnselected
    case twoSelected
}

struct RadioButton {
    struct CustomButtonView<CustomLabelType: View>: View {
        let style: RadioButtonStyle
        let action: () -> Void
        let label: CustomLabelType?
        var body: some View {
            Button(action: action) {
                if let label {
                    VStack {
                        label
                    }
                }
            }
            .buttonStyle(RadioButtonStyleModifiers(style: style))
        }
        
        init(
            style: RadioButtonStyle,
            action: @escaping () -> Void,
            @ViewBuilder label: () -> CustomLabelType
        ) {
            self.style = style
            self.action = action
            self.label = label()
        }
    }
}

public struct RadioButtonStyleModifiers: ButtonStyle {
    
    let style: RadioButtonStyle
    
    @ViewBuilder
    public func makeBody(configuration: Self.Configuration) -> some View {
        switch style {
        case .oneUnselected:
            configuration.label
                .foregroundColor(configuration.isPressed ? Color.PB4 : .black)
                .frame(maxWidth: .infinity)
                .padding(.leading, 20.0)
                .padding(.vertical, 22)
                .background(RoundedRectangle(cornerRadius: 16).fill(configuration.isPressed ? Color.PB3 : Color.G2))
                .overlay(RoundedRectangle(cornerRadius: 16)
                .stroke(configuration.isPressed ? Color.TPB : Color.G2, lineWidth: 2))
            
        case .oneSelected:
            configuration.label
                .foregroundColor(Color.PB4)
                .frame(maxWidth: .infinity)
                .padding(.leading, 20.0)
                .padding(.vertical, 22)
                .background(RoundedRectangle(cornerRadius: 16).fill(Color.PB2))
                .overlay(RoundedRectangle(cornerRadius: 16)
                .stroke(Color.PB4, lineWidth: 2))
            
        case .twoUnselected:
            configuration.label
                .foregroundColor(configuration.isPressed ? Color.PB4 : .black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(RoundedRectangle(cornerRadius: 10).fill(configuration.isPressed ? Color.PB3 : Color.G2))
                .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(configuration.isPressed ? Color.TPB : Color.G2, lineWidth: 2))
            
        case .twoSelected:
            configuration.label
                .foregroundColor(Color.PB4)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.PB2))
                .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.PB4, lineWidth: 2))
        }
    }
}

struct RadioButtonExampleView: View {
    @State var isSelected = false
    
    var body: some View {
        VStack {
            // RadioOne
            let oneStyle: RadioButtonStyle = isSelected ? .oneSelected : .oneUnselected
            VStack(spacing: 10) {
                ForEach(0..<3) { _ in
                    RadioButton.CustomButtonView(style: oneStyle) {
                        isSelected.toggle()
                    } label: {
                        HStack {
                            VStack(alignment: .leading, spacing: 13) {
                                Text("타이틀")
                                    .T3()
                                Text("설명")
                                    .Cap3()
                                
                            }
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
            
            //RadioTwo
            let twoStyle: RadioButtonStyle = isSelected ? .twoSelected : .twoUnselected
            HStack(spacing: 10) {
                RadioButton.CustomButtonView(style: twoStyle) {
                    isSelected.toggle()
                } label: {
                    Text("네")
                }
                RadioButton.CustomButtonView(style: twoStyle) {
                    isSelected.toggle()
                } label: {
                    Text("아니오")
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct RadioButton_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonExampleView()
    }
}
