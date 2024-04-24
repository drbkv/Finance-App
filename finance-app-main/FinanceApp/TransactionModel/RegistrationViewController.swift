//
//
//import UIKit
//import Firebase
//import Alamofire
//
//class RegistrationViewController: UIViewController {
//
//    let nameTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Name"
//        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//    
//    let emailTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Email"
//        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//    
//    let passwordTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Password"
//        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.isSecureTextEntry = true
//        return textField
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//
//        setupViews()
//    }
//
//    func setupViews() {
//        view.addSubview(nameTextField)
//        view.addSubview(emailTextField)
//        view.addSubview(passwordTextField)
//        
//        NSLayoutConstraint.activate([
//            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            nameTextField.heightAnchor.constraint(equalToConstant: 40),
//            
//            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
//            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            emailTextField.heightAnchor.constraint(equalToConstant: 40),
//            
//            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
//            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
//        ])
//
//        let registerButton = UIButton(type: .system)
//        registerButton.setTitle("Register", for: .normal)
//        registerButton.addTarget(self, action: #selector(registerButtonTapped(_:)), for: .touchUpInside)
//        registerButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(registerButton)
//        NSLayoutConstraint.activate([
//            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
//            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            registerButton.heightAnchor.constraint(equalToConstant: 40)
//        ])
//    }
//
//    @objc func registerButtonTapped(_ sender: UIButton) {
//        guard let name = nameTextField.text, let email = emailTextField.text, let password = passwordTextField.text else {
//            return
//        }
//
//        let registrationManager = RegistrationManager.shared
//        registrationManager.registerUser(name: name, email: email, password: password) { [weak self] error in
//            if let error = error {
//                // Handle registration error
//            } else {
//                // Registration successful, navigate to next screen or show success message
//            }
//        }
//    }
//}
//
//
//import UIKit
//
//class RegistrationViewController: UIViewController {
//
//    let nameTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Name"
//        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//    
//    let emailTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Email"
//        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//    
//    let passwordTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Password"
//        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.isSecureTextEntry = true
//        return textField
//    }()
//    
//    // Добавляем свойство для хранения данных пользователя
//    var userData: UserData?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//
//        setupViews()
//    }
//
//    func setupViews() {
//        view.addSubview(nameTextField)
//        view.addSubview(emailTextField)
//        view.addSubview(passwordTextField)
//        
//        NSLayoutConstraint.activate([
//            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            nameTextField.heightAnchor.constraint(equalToConstant: 40),
//            
//            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
//            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            emailTextField.heightAnchor.constraint(equalToConstant: 40),
//            
//            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
//            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
//        ])
//
//        let registerButton = UIButton(type: .system)
//        registerButton.setTitle("Register", for: .normal)
//        registerButton.addTarget(self, action: #selector(registerButtonTapped(_:)), for: .touchUpInside)
//        registerButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(registerButton)
//        NSLayoutConstraint.activate([
//            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
//            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            registerButton.heightAnchor.constraint(equalToConstant: 40)
//        ])
//    }
//
//    @objc func registerButtonTapped(_ sender: UIButton) {
//        guard let name = nameTextField.text, let email = emailTextField.text, let password = passwordTextField.text else {
//            return
//        }
//        
//        let registrationManager = RegistrationManager.shared
//        registrationManager.registerUser(name: name, email: email, password: password) { error in
//            if let error = error {
//                // Handle registration error
//            } else {
//                // Registration successful, navigate to next screen or show success message
//            }
//        }
//    }
//
//}
//
//




import UIKit

class RegistrationViewController: UIViewController {
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        return textField
    }()
    
    // Добавляем свойство для хранения данных пользователя
    var userData: UserData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let registerButton = UIButton(type: .system)
        registerButton.setTitle("Register", for: .normal)
        registerButton.addTarget(self, action: #selector(registerButtonTapped(_:)), for: .touchUpInside)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerButton)
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func registerButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        let registrationManager = RegistrationManager.shared
        registrationManager.registerUser(email: email, password: password) { [weak self] error in
            if let error = error {
                // Handle registration error
                print("Registration error: \(error.localizedDescription)")
            } else {
                // Registration successful, show success message
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Успешная регистрация", message: "Вы успешно зарегистрировались", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self?.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}
