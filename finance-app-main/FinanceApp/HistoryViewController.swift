//import UIKit
//
//class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//
//    private let transactionManager = TransactionManager.shared
//    private var transactions: [Transaction] = []
//
//    private lazy var tableView: UITableView = {
//        let table = UITableView(frame: .zero, style: .insetGrouped)
//        table.dataSource = self
//        table.delegate = self
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        return table
//    }()
//
//    deinit {
//        transactionManager.databaseRef.child("transactions").removeAllObservers()
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        view.addSubview(tableView)
//
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
//
//        reloadData()
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return transactions.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
//        let transaction = transactions[indexPath.row]
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd.MM.yyyy"
//        if let transactionDate = transaction.date {
//            cell.textLabel?.text = transaction.operationCategory ? "+\(transaction.sum)₸" : "-\(transaction.sum)₸"
//            cell.detailTextLabel?.text = "Описание: \(transaction.descript ?? ""), Дата: \(dateFormatter.string(from: transactionDate))"
//        } else {
//            cell.textLabel?.text = "Дата не указана"
//            cell.detailTextLabel?.text = "Описание отсутствует"
//        }
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] (action, view, completionHandler) in
//            guard let self = self else { return }
//            let transactionToDelete = self.transactions[indexPath.row]
//            self.transactionManager.deleteTransaction(transactionId: transactionToDelete.transactionId!) { [weak self] error in
//                if let error = error {
//                    print("Failed to delete transaction: \(error.localizedDescription)")
//                } else {
//                    self?.reloadData()
//                }
//            }
//            completionHandler(true)
//        }
//        deleteAction.backgroundColor = .red
//
//        let editAction = UIContextualAction(style: .normal, title: "Редактировать") { [weak self] (action, view, completionHandler) in
//            guard let self = self else { return }
//            let transactionToEdit = self.transactions[indexPath.row]
//            // Здесь вы можете показать экран редактирования и передать transactionToEdit
//            // Например:
//            // let editViewController = EditTransactionViewController(transaction: transactionToEdit)
//            // self.present(editViewController, animated: true, completion: nil)
//            completionHandler(true)
//        }
//        editAction.backgroundColor = .blue
//
//        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
//        configuration.performsFirstActionWithFullSwipe = false
//        return configuration
//    }
//
//    func reloadData() {
//        transactionManager.fetchTransactions { [weak self] transactions in
//            self?.transactions = transactions
//            DispatchQueue.main.async {
//                self?.tableView.reloadData()
//            }
//        }
//    }
//}

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let transactionManager = TransactionManager.shared
    private var transactions: [Transaction] = []

    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.dataSource = self
        table.delegate = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    deinit {
        transactionManager.databaseRef.child("transactions").removeAllObservers()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let transaction = transactions[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        if let transactionDate = transaction.date {
            cell.textLabel?.text = transaction.operationCategory ? "+\(transaction.sum)₸" : "-\(transaction.sum)₸"
            cell.detailTextLabel?.text = "Description: \(transaction.descript ?? ""), Date: \(dateFormatter.string(from: transactionDate))"
        } else {
            cell.textLabel?.text = "Date not specified"
            cell.detailTextLabel?.text = "No description"
        }
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completionHandler) in
            guard let self = self else { return }
            let transactionToDelete = self.transactions[indexPath.row]
            self.transactionManager.deleteTransaction(transactionId: transactionToDelete.transactionId!) { [weak self] error in
                if let error = error {
                    print("Failed to delete transaction: \(error.localizedDescription)")
                } else {
                    self?.reloadData()
                }
            }
            completionHandler(true)
        }
        deleteAction.backgroundColor = .red

        let editAction = UIContextualAction(style: .normal, title: "Edit") { [weak self] (action, view, completionHandler) in
            guard let self = self else { return }
            let transactionToEdit = self.transactions[indexPath.row]
            self.editTransaction(transaction: transactionToEdit)
            completionHandler(true)
        }
        editAction.backgroundColor = .blue

        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }

    func editTransaction(transaction: Transaction) {
        let alertController = UIAlertController(title: "Edit Transaction", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "New sum"
            textField.text = "\(transaction.sum)"
            textField.keyboardType = .numberPad
        }
        alertController.addTextField { textField in
            textField.placeholder = "New description"
            textField.text = transaction.descript
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self, weak alertController] _ in
            guard let self = self,
                  let sumString = alertController?.textFields?.first?.text,
                  let newSum = Int(sumString),
                  let newDescription = alertController?.textFields?.last?.text else {
                return
            }
            self.transactionManager.updateTransaction(transactionId: transaction.transactionId!, sum: newSum, descript: newDescription, date: transaction.date, operationCategory: transaction.operationCategory) { error in
                if let error = error {
                    print("Failed to update transaction: \(error.localizedDescription)")
                } else {
                    self.reloadData()
                }
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        present(alertController, animated: true, completion: nil)
    }

    func reloadData() {
        transactionManager.fetchTransactions { [weak self] transactions in
            self?.transactions = transactions
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}
