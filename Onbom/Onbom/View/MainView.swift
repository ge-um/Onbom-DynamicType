//
//  MainView.swift
//  Onbom
//
//  Created by moon on 2023/10/06.
//

import SwiftUI

struct MainView: View {
    @StateObject private var homeNavigation = HomeNavigationViewModel()
    
    var body: some View {
        TabView {
            NavigationStack(path: $homeNavigation.homePath) {
                HomeView()
                    .navigationDestination(for: HomeRoute.self) { route in
                        switch(route) {
                        case .ApplyTypeView:                    ApplyTypeView().toolbar(.hidden, for: .tabBar)
                        case .MediHistoryView:                  MediHistoryView()
                        case .MediConditionView:                MediConditionView()
                        case .IDCardDescriptionView:            IDCardDescriptionView()
                        case .IDCardOCRView:                    IDCardOCRView()
                        case .IDCardConfirmEditView:            IDCardConfirmEditView(image: .constant(UIImage()))
                        case .AddressFormView:                  AddressFormView(formType: .actualPatient)
                        case .SignatureView:                    SignatureView()
                        case .SubmitCheckListView:              SubmitCheckListView()
                        case .StepView_First:                   StepView(state: .FIRST)
                        case .StepView_Second:                  StepView(state: .SECOND)
                        case .PatientInfoView:                  PatientInfoView()
                        case .AgentInfoView:                    AgentInfoView()
                        case .RejectView:                       RejectView()
                        default:                                RejectView()
                        }
                    }
            }
            .environmentObject(homeNavigation)
            .tint(Color.G5)
            .tabItem {
                Image("home")
                Text("홈")
                    .Cap5()
            }
            
            Text("신청 내역 화면")
            .tabItem {
                Image("form_history")
                Text("신청 내역")
                    .Cap5()
            }
            
            Text("프로필 화면")
            .tabItem {
                Image("profile")
                Text("내 정보")
                    .Cap5()
            }
        }
        .tint(Color.PB4)
    }
}
