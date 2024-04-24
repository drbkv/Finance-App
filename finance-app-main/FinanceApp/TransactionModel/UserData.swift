//struct UserData {
//let email: String
//let password: String
//let name: String?
//let surname: String?
//let dateOfBirth: String?
//let avatarURL: String?
//
//init(email: String, password: String, name: String? = nil, surname: String? = nil, dateOfBirth: String? = nil, avatarURL: String? = nil) {
//    self.email = email
//    self.password = password
//    self.name = name
//    self.surname = surname
//    self.dateOfBirth = dateOfBirth
//    self.avatarURL = avatarURL
//}
//}


class UserData {
    var email: String
    var password: String
    var name: String?
    var surname: String?
    var dateOfBirth: String?
    var avatarURL: String?

    init(email: String, password: String, name: String?, surname: String?, dateOfBirth: String?, avatarURL: String?) {
        self.email = email
        self.password = password
        self.name = name
        self.surname = surname
        self.dateOfBirth = dateOfBirth
        self.avatarURL = avatarURL
    }
}
