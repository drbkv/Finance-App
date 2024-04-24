//import UIKit
//import Firebase
//
//struct Transaction {
//    var transactionId: String?
//    var sum: Int
//    var descript: String?
//    var date: Date?
//    var operationCategory: Bool
//    var userId: String
//
//    init(sum: Int, descript: String?, date: Date?, operationCategory: Bool, userId: String) {
//        self.sum = sum
//        self.descript = descript
//        self.date = date
//        self.operationCategory = operationCategory
//        self.userId = userId
//    }
//}
//

import UIKit
import Firebase

struct Transaction {
    var transactionId: String?
    var sum: Int
    var descript: String?
    var date: Date?
    var operationCategory: Bool
    var userId: String

    init(sum: Int, descript: String?, date: Date?, operationCategory: Bool, userId: String) {
        self.sum = sum
        self.descript = descript
        self.date = date
        self.operationCategory = operationCategory
        self.userId = userId
    }
}
