//
//import Foundation
//import Firebase
//
//class TransactionManager {
//    static let shared = TransactionManager()
//    internal let databaseRef = Database.database().reference(fromURL: "https://finance-ed63e-default-rtdb.firebaseio.com/")
//    private let auth = Auth.auth()
//
//    private init() {}
//
//    func currentUser() -> User? {
//        return auth.currentUser
//    }
//
//    func addTransaction(sum: Int, descript: String?, date: Date?, operationCategory: Bool, completion: @escaping (Error?) -> Void) {
//        guard let userId = auth.currentUser?.uid else {
//            print("User is not authenticated")
//            return
//        }
//
//        let transactionRef = databaseRef.child("transactions").childByAutoId()
//        let transactionId = transactionRef.key
//        let transactionData: [String: Any] = [
//            "sum": sum,
//            "descript": descript ?? "",
//            "date": date?.timeIntervalSince1970 ?? 0,
//            "operationCategory": operationCategory,
//            "userId": userId,
//            "transactionId": transactionId
//        ]
//        transactionRef.setValue(transactionData) { (error, _) in
//            completion(error)
//        }
//    }
//
//    func fetchTransactions(completion: @escaping ([Transaction]) -> Void) {
//        guard let userId = auth.currentUser?.uid else {
//            print("User is not authenticated")
//            return
//        }
//
//        databaseRef.child("transactions").queryOrdered(byChild: "userId").queryEqual(toValue: userId).observeSingleEvent(of: .value) { snapshot in
//            var transactions: [Transaction] = []
//            for child in snapshot.children {
//                if let childSnapshot = child as? DataSnapshot,
//                   let transactionDict = childSnapshot.value as? [String: Any],
//                   let sum = transactionDict["sum"] as? Int,
//                   let descript = transactionDict["descript"] as? String,
//                   let dateDouble = transactionDict["date"] as? Double,
//                   let date = dateDouble > 0 ? Date(timeIntervalSince1970: dateDouble) : nil,
//                   let operationCategory = transactionDict["operationCategory"] as? Bool {
//                    let transaction = Transaction(sum: sum, descript: descript, date: date, operationCategory: operationCategory, userId: userId)
//                    transactions.append(transaction)
//                }
//            }
//            completion(transactions)
//        }
//    }
//
//    func deleteTransaction(_ transaction: Transaction, completion: @escaping (Error?) -> Void) {
//        guard let transactionId = transaction.transactionId else {
//            print("TransactionId is missing")
//            return
//        }
//
//        let transactionRef = databaseRef.child("transactions").child(transactionId)
//        transactionRef.removeValue { (error, _) in
//            completion(error)
//        }
//    }
//}
//

import UIKit
import Firebase
class TransactionManager {
    static let shared = TransactionManager()
    internal let databaseRef = Database.database().reference(fromURL: "https://finance-ed63e-default-rtdb.firebaseio.com/")
    private let auth = Auth.auth()

    private var homeViewController: HomeViewController?

    private init() {}

    func setHomeViewController(_ viewController: HomeViewController) {
        homeViewController = viewController
    }

    func currentUser() -> User? {
        return auth.currentUser
    }

    func addTransaction(sum: Int, descript: String?, date: Date?, operationCategory: Bool, completion: @escaping (Error?) -> Void) {
        guard let userId = auth.currentUser?.uid else {
            print("User is not authenticated")
            return
        }

        let transactionRef = databaseRef.child("transactions").childByAutoId()
        let transactionId = transactionRef.key
        let transactionData: [String: Any] = [
            "sum": sum,
            "descript": descript ?? "",
            "date": date?.timeIntervalSince1970 ?? 0,
            "operationCategory": operationCategory,
            "userId": userId,
            "transactionId": transactionId
        ]
        transactionRef.setValue(transactionData) { (error, _) in
            completion(error)
        }
    }

    func fetchTransactions(completion: @escaping ([Transaction]) -> Void) {
        guard let userId = auth.currentUser?.uid else {
            print("User is not authenticated")
            return
        }

        databaseRef.child("transactions").queryOrdered(byChild: "userId").queryEqual(toValue: userId).observeSingleEvent(of: .value) { snapshot in
            var transactions: [Transaction] = []
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                   let transactionDict = childSnapshot.value as? [String: Any],
                   let sum = transactionDict["sum"] as? Int,
                   let descript = transactionDict["descript"] as? String,
                   let dateDouble = transactionDict["date"] as? Double,
                   let date = dateDouble > 0 ? Date(timeIntervalSince1970: dateDouble) : nil,
                   let operationCategory = transactionDict["operationCategory"] as? Bool {
                    var transaction = Transaction(sum: sum, descript: descript, date: date, operationCategory: operationCategory, userId: userId)
                    transaction.transactionId = childSnapshot.key
                    transactions.append(transaction)
                }
            }
            completion(transactions)
        }
    }


    func deleteTransaction(transactionId: String, completion: @escaping (Error?) -> Void) {
        let transactionRef = databaseRef.child("transactions").child(transactionId)
        transactionRef.removeValue { [weak self] (error, _) in
            if error == nil {
                self?.homeViewController?.updateBudget()
            }
            completion(error)
        }
    }

    func updateTransaction(transactionId: String, sum: Int, descript: String?, date: Date?, operationCategory: Bool, completion: @escaping (Error?) -> Void) {
        guard let userId = auth.currentUser?.uid else {
            print("User is not authenticated")
            return
        }

        let transactionRef = databaseRef.child("transactions").child(transactionId)
        let transactionData: [String: Any] = [
            "sum": sum,
            "descript": descript ?? "",
            "date": date?.timeIntervalSince1970 ?? 0,
            "operationCategory": operationCategory,
            "userId": userId,
            "transactionId": transactionId
        ]
        transactionRef.setValue(transactionData) { (error, _) in
            completion(error)
        }
    }
}
