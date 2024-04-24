
class UserData {
    var email: String
    var password: String
    var name: String?
    var surname: String?
    var dateOfBirth: String?

    init(email: String, password: String, name: String?, surname: String?, dateOfBirth: String?) {
        self.email = email
        self.password = password
        self.name = name
        self.surname = surname
        self.dateOfBirth = dateOfBirth
    }
}
