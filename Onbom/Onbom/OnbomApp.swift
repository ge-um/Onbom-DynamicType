//
//  OnbomApp.swift
//  Onbom
//
//  Created by moon on 2023/09/22.
//

import SwiftUI
import FirebaseCore
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct OnbomApp: App {
    
    init() {
        FirebaseApp.configure()
        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"]!
        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
				.environmentObject(AuthenticationViewModel())
				.onOpenURL { url in
                if (AuthApi.isKakaoTalkLoginUrl(url) == false) {
                    print("유효하지 않은 url입니다")
                    return
                }
                let _ = AuthController.handleOpenUrl(url: url)
            }
        }
    }
}
