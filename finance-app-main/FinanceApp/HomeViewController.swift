//import UIKit
//
//class HomeViewController: UIViewController {
//
//    var budgetLabel: UILabel!
//    private let transactionManager = TransactionManager.shared
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//
//        // Создание и настройка метки для отображения бюджета
//        budgetLabel = UILabel()
//        budgetLabel.translatesAutoresizingMaskIntoConstraints = false
//        budgetLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
//        budgetLabel.textAlignment = .center
//        view.addSubview(budgetLabel)
//        
//        // Ограничения для метки
//        NSLayoutConstraint.activate([
//            budgetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            budgetLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
//        
//        // Обновляем бюджет
//        updateBudget()
//    }
//
//    // Обновление бюджета
//    func updateBudget() {
//        transactionManager.fetchTransactions { [weak self] transactions in
//            let totalAmount = transactions.reduce(0) { (result, transaction) in
//                if transaction.operationCategory {
//                    return result + transaction.sum
//                } else {
//                    return result - transaction.sum
//                }
//            }
//            DispatchQueue.main.async {
//                self?.budgetLabel.text = "Ваш бюджет: \(totalAmount)₸"
//            }
//        }
//    }
//}
import UIKit

class HomeViewController: UIViewController {

    var budgetLabel: UILabel!
    private let transactionManager = TransactionManager.shared
    private var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Create and configure the label for displaying the budget
        budgetLabel = UILabel()
        budgetLabel.translatesAutoresizingMaskIntoConstraints = false
        budgetLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        budgetLabel.textAlignment = .center
        view.addSubview(budgetLabel)
        
        // Constraints for the label
        NSLayoutConstraint.activate([
            budgetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            budgetLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Start the timer to update the budget label every 5 seconds
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(updateBudget), userInfo: nil, repeats: true)
        timer?.fire() // Update immediately when the view appears
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Stop the timer when the view disappears
        timer?.invalidate()
    }

    @objc func updateBudget() {
        transactionManager.fetchTransactions { [weak self] transactions in
            let totalAmount = transactions.reduce(0) { (result, transaction) in
                if transaction.operationCategory {
                    return result + transaction.sum
                } else {
                    return result - transaction.sum
                }
            }
            DispatchQueue.main.async {
                self?.budgetLabel.text = "Your budget: \(totalAmount)₸"
            }
        }
    }
}
