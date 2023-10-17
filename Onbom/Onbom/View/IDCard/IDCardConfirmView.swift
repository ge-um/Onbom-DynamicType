//
//  IDCardConfirmView.swift
//  Onbom
//
//  Created by Junyoo on 2023/10/15.
//

import SwiftUI

struct IDCardConfirmView: View {
    @State private var frontIDNumber = ""
    @State private var backIDNumber = ""
    @State private var isValid = false
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var application: ApplicationInfo

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("신분증 정보를 확인해 주세요")
                        .H2()
                        .foregroundColor(.B)
                    Spacer()
                }
                .padding()

                HStack(spacing: 4) {
                    Image("security")
                        .padding(.leading)
                    Text("신분증 정보는 저장되지 않고, 신청 즉시 파기돼요")
                        .foregroundColor(Color.G6)
                        .Cap4()
                        .padding(.vertical)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.PB1))
                .padding(20)

                Rectangle()
                    .foregroundColor(.gray)
                    .overlay {
                        if let image = application.image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                        } else {
                            Text("사진없음")
                        }
                    }
                    .padding()
                    .frame(height: 250)

                IDNumberInputField(frontNumber: $frontIDNumber, backNumber: $backIDNumber)
                    .onAppear {
                        frontIDNumber = application.agentID
                        backIDNumber = application.agentID
                    }

                Spacer()

                //CTA Button
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("재촬영")
                    }
                    Spacer()
                    NavigationLink(destination: EmptyView()) {
                        Text("다음")
                    }
                }
                .padding()
            }
        }
        .navigationBarBackButton()
    }
}

struct IDCardConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        IDCardConfirmView()
            .environmentObject(ApplicationInfo())
    }
}

