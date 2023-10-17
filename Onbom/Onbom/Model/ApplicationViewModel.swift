//
//  ApplicationViewModel.swift
//  Onbom
//
//  Created by Junyoo on 2023/10/09.
//

import SwiftUI

class ApplicationInfo: ObservableObject {
    @Published var image: UIImage?
    
    @Published var patientName = "김순옥"
    @Published var patientID = "123456-1234567"
    @Published var patientAddress = Address(cityAddress: "경기 성남시 분당구 판교역로 4 (백현동)", detailAddress: "주민등록지")
    @Published var patientActualAddress = Address(cityAddress: "경기 성남시 분당구 판교역로 4 (백현동)", detailAddress: "살고있는곳")
    @Published var patientPhoneNumber: String?
    
    @Published var agentName = "김유진"
    @Published var agentRelation = "가족"
    @Published var agentID = "123456-1234567"
    @Published var agentAddress = Address(cityAddress: "경기 성남시 분당구 판교역로 4 (백현동)", detailAddress: "보호자주소지")
    @Published var agentPhoneNumber = "010-1234-5678"
    
    func updateImage(newImage: UIImage?) {
        self.image = newImage
    }
    
    func combinePatientID(frontID: String, backID: String) {
        self.patientID = "\(frontID)-\(backID)"
    }
    func updatePatientAddress(address: Address) {
        self.patientAddress = address
    }
    func updatePatientActualAddress(actualAddress: Address) {
        self.patientActualAddress = actualAddress
    }
    
    func combineAgentID(frontID: String, backID: String) {
        self.agentID = "\(frontID)-\(backID)"
    }
    func updateAgentAddress(address: Address) {
        self.agentAddress = address
    }
    
    func splitID(id: String) -> (frontID: String, backID: String)? {
        let components = id.split(separator: "-")
        if components.count == 2 {
            return (String(components[0]), String(components[1]))
        }
        return nil
    }
}

struct Address {
    var cityAddress: String
    var detailAddress: String
}


//struct ApplicationModel {
//    var image: UIImage?
//
//    var patientName: String
//    var patientID: String
//    var patientAddress: Address
//    var patientActualAddress: Address
//    var patientPhoneNumber: String?
//
//    var agentName: String
//    var agentRelation: String
//    var agentID: String
//    var agentAddress: Address
//    var agentPhoneNumber: String
//    var image: UIImage?
//    var patientName = "김순옥"
//    var patientID = "123456-1234567"
//    var patientAddress = Address()
//    var patientActualAddress = Address()
//    var patientPhoneNumber: String?
//
//    var agentName = "김유진"
//    var agentRelation = "가족"
//    var agentID = "123456-1234567"
//    var agentAddress = Address()
//    var agentPhoneNumber = "010-1234-5678"
//}



class UserViewModel {
    @Published var patient: Patient = Patient()
    @Published var agent: Agent = Agent()
    
    func updateAgentAddress(city: String, detail: String) {
        agent.updateAddress(city: city, detail: detail)
    }
    
    func updatePatientAddress(city: String, detail: String) {
        patient.updateAddress(city: city, detail: detail)
    }
    
    func updatePatientActualAddress(city: String, detail: String) {
        patient.updateActualAddress(city: city, detail: detail)
    }
    
//    func updateAgentInfo(name: , id, phonenumber){
//        
//    }
//    func updatePatientInfo(id ) {
//        
//    }
}

protocol UserProtocol {
    var name: String? { get set }
    var id: String? { get set }
    var address: Address? { get set }
    
    func updateAddress(city: String, detail: String)
}

class Patient: UserProtocol {
    var name: String?
    var id: String?
    var address: Address?
    var actualAddress: Address?
    var phoneNumber: String?
        
    func updateAddress(city: String, detail: String) {
        address = Address(cityAddress: city, detailAddress: detail)
    }
    
    func updateActualAddress(city: String, detail: String) {
        actualAddress = Address(cityAddress: city, detailAddress: detail)
    }
}

class Agent: UserProtocol {
    var name: String? = "김유진"
    var id: String?
    var address: Address?
    var phoneNumber: String? = "010-1234-5678"
    
    func updateAddress(city: String, detail: String) {
        address = Address(cityAddress: city, detailAddress: detail)
    }
}
