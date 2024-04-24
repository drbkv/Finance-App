//import UIKit
//import Firebase
//
//class MyProfileViewController: UIViewController {
//
//    let nameLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Name:"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    let nameTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Enter your name"
//        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//
//    let surnameLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Surname:"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    let surnameTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Enter your surname"
//        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//
//    let emailLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Email:"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    let emailTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Enter your email"
//        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//
//    let phoneNumberLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Phone Number:"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    let phoneNumberTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Enter your phone number"
//        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//
//    let dateOfBirthLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Date of Birth:"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    let dateOfBirthTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Enter your date of birth"
//        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//
//    let saveButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Save", for: .normal)
//        button.addTarget(self, action: #selector(saveButtonTapped(_:)), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//
//        setupViews()
//        loadUserData()
//    }
//
//    func setupViews() {
//        let stackView = UIStackView(arrangedSubviews: [nameLabel, nameTextField, surnameLabel, surnameTextField, emailLabel, emailTextField, phoneNumberLabel, phoneNumberTextField, dateOfBirthLabel, dateOfBirthTextField, saveButton])
//        stackView.axis = .vertical
//        stackView.spacing = 10
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addSubview(stackView)
//
//        NSLayoutConstraint.activate([
//            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
//        ])
//    }
//
//    func loadUserData() {
//        guard let userId = Auth.auth().currentUser?.uid else {
//            return
//        }
//
//        let ref = Database.database().reference().child("users").child(userId)
//        ref.observeSingleEvent(of: .value) { [weak self] (snapshot) in
//            guard let self = self, let userData = snapshot.value as? [String: Any] else {
//                return
//            }
//
//            self.nameTextField.text = userData["name"] as? String ?? ""
//            self.surnameTextField.text = userData["surname"] as? String ?? ""
//            self.emailTextField.text = userData["email"] as? String ?? ""
//            self.phoneNumberTextField.text = userData["phoneNumber"] as? String ?? ""
//            self.dateOfBirthTextField.text = userData["dateOfBirth"] as? String ?? ""
//        }
//    }
//
//    @objc func saveButtonTapped(_ sender: UIButton) {
//        guard let userId = Auth.auth().currentUser?.uid else {
//            return
//        }
//
//        let userData: [String: Any] = [
//            "name": nameTextField.text ?? "",
//            "surname": surnameTextField.text ?? "",
//            "email": emailTextField.text ?? "",
//            "phoneNumber": phoneNumberTextField.text ?? "",
//            "dateOfBirth": dateOfBirthTextField.text ?? ""
//        ]
//
//        let ref = Database.database().reference().child("users").child(userId)
//        ref.setValue(userData) { (error, ref) in
//            if let error = error {
//                print("Error saving user data: \(error.localizedDescription)")
//            } else {
//                print("User data saved successfully")
//            }
//        }
//    }
//}


import UIKit
import Firebase

class MyProfileViewController: UIViewController {

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isEnabled = false // Disable editing initially
        return textField
    }()

    let surnameLabel: UILabel = {
        let label = UILabel()
        label.text = "Surname:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let surnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your surname"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isEnabled = false // Disable editing initially
        return textField
    }()

    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your email"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isEnabled = false // Disable editing initially
        return textField
    }()

    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your phone number"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isEnabled = false // Disable editing initially
        return textField
    }()

    let dateOfBirthLabel: UILabel = {
        let label = UILabel()
        label.text = "Date of Birth:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let dateOfBirthTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your date of birth"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isEnabled = false // Disable editing initially
        return textField
    }()

    let editButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit", for: .normal)
        button.addTarget(self, action: #selector(editButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(saveButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true // Hidden initially
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupViews()
        loadUserData()
    }

    func setupViews() {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, nameTextField, surnameLabel, surnameTextField, emailLabel, emailTextField, phoneNumberLabel, phoneNumberTextField, dateOfBirthLabel, dateOfBirthTextField, editButton, saveButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    func loadUserData() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }

        let ref = Database.database().reference().child("users").child(userId)
        ref.observeSingleEvent(of: .value) { [weak self] (snapshot) in
            guard let self = self, let userData = snapshot.value as? [String: Any] else {
                return
            }

            self.nameTextField.text = userData["name"] as? String ?? ""
            self.surnameTextField.text = userData["surname"] as? String ?? ""
            self.emailTextField.text = userData["email"] as? String ?? ""
            self.phoneNumberTextField.text = userData["phoneNumber"] as? String ?? ""
            self.dateOfBirthTextField.text = userData["dateOfBirth"] as? String ?? ""
        }
    }

    @objc func editButtonTapped(_ sender: UIButton) {
        nameTextField.isEnabled = true
        surnameTextField.isEnabled = true
        emailTextField.isEnabled = true
        phoneNumberTextField.isEnabled = true
        dateOfBirthTextField.isEnabled = true

        editButton.isHidden = true
        saveButton.isHidden = false
    }

    @objc func saveButtonTapped(_ sender: UIButton) {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }

        let userData: [String: Any] = [
            "name": nameTextField.text ?? "",
            "surname": surnameTextField.text ?? "",
            "email": emailTextField.text ?? "",
            "phoneNumber": phoneNumberTextField.text ?? "",
            "dateOfBirth": dateOfBirthTextField.text ?? ""
        ]

        let ref = Database.database().reference().child("users").child(userId)
        ref.setValue(userData) { (error, ref) in
            if let error = error {
                print("Error saving user data: \(error.localizedDescription)")
            } else {
                print("User data saved successfully")
                self.editButton.isHidden = false
                self.saveButton.isHidden = true

                self.nameTextField.isEnabled = false
                self.surnameTextField.isEnabled = false
                self.emailTextField.isEnabled = false
                self.phoneNumberTextField.isEnabled = false
                self.dateOfBirthTextField.isEnabled = false
            }
        }
    }
}
