


import Foundation
import Alamofire
import Firebase

class RegistrationManager {
    static let shared = RegistrationManager()
    private init() {}
    
    private var registeredName: String?
    
    // Method to set registered name
    func setRegisteredName(_ name: String) {
        registeredName = name
    }
    
    // Method to get registered name
    func getRegisteredName() -> String? {
        return registeredName
    }
    
    // RegistrationManager.swift
    
    func registerUser(email: String, password: String, completion: @escaping (Error?) -> Void) {
        let parameters: [String: Any] = [
            "email": email,
            "password": password,
            "returnSecureToken": true
        ]
        
        let url = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDnXHyZ1EgRL2J0efR34qlrRR0utHXUOFY"
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success:
                    completion(nil)
                case .failure(let error):
                    print(error)
                    completion(error)
                }
            }
    }



}

