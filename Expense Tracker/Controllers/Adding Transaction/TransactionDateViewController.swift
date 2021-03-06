//
//  TransactionDateViewController.swift
//  Expense Tracker
//
//  Created by isEmpty on 18.12.2020.
//

import UIKit
import CoreData

final class TransactionDateViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var transactionIconBackground: UIView!
    @IBOutlet private weak var transactionIconLabel: UILabel!
    @IBOutlet private weak var transactionTypeLabel: UILabel!
    @IBOutlet private weak var categoryBackground: UIView!
    @IBOutlet private weak var categoryImage: UIImageView!
    @IBOutlet private weak var transactionNameLabel: UILabel!
    @IBOutlet private weak var transactionAmountLabel: UILabel!
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var finishButton: UIButton!
    @IBOutlet private weak var datePickerBottomConstraint: NSLayoutConstraint!
    
    //MARK: - Properties
    public var transaction: Transaction!
    private let appSettings = AppSettings.shared
    private var balance: Balance!
    
    //MARK: - Computed Properties
    private lazy var context: NSManagedObjectContext = {
        return transaction.managedObjectContext!
    }()
    
    private lazy var mainContext: NSManagedObjectContext = {
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.container.viewContext
    }()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure UI
        configureTransactionType()
        configureTransactionCategory()
        configureTransactionNameAndAmount()
        configureFinishButton()
        navigationController?.navigationItem.backBarButtonItem?.tintColor = .black
        datePicker.tintColor = transactionIconBackground.backgroundColor
        // Setup Data
        setupNotificationCenter()
        setupBalance()
    }
    
    //MARK: - Actions
    /// Saves data to `context`. If everything is successful, dismiss.
    @IBAction func finishTapped(_ sender: Any) {
        transaction.date = datePicker.date
        balance.totalBalance -= transaction.isExpense ?
            transaction.amount : -transaction.amount
        transaction.balance = balance
        do {
            try context.save()
            saveOnMainContext()
            dismiss(animated: true, completion: nil)
        } catch {
            print(error)
            showAlert(alertText: error.localizedDescription)
        }
    }
}

//MARK: - Supporting Methods
extension TransactionDateViewController {
    /// Saving all changes on main context
    private func saveOnMainContext() {
        context.performAndWait {
            do {
                try mainContext.save()
            } catch {
                print(error)
                showAlert(alertText: error.localizedDescription)
            }
        }
    }
    
    /// Sets datePickerBottomConstraint to Keyboard Heigh.
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.datePickerBottomConstraint.constant = keyboardSize.height
        }
    }

    /// Sets datePickerBottomConstraint to 0.
    @objc private func keyboardWillHide(notification: NSNotification) {
        self.datePickerBottomConstraint.constant = 0
    }
    
    /// Receives balance data from CoreData or creates a new object.
    private func setupBalance() {
        let fetchRequest:NSFetchRequest = Balance.fetchRequest()
        do {
            balance = try context.fetch(fetchRequest).first ?? Balance(context: context)
        } catch {
            print(error)
        }
    }
    
    /// Subscribes to notifications of `keyboardWillShowNotification` and `keyboardWillHideNotification`.
    private func setupNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

//MARK: - Configure Layouts
extension TransactionDateViewController {
    /// Changes the appearance of items depending on the type of `transaction`.
    private func configureTransactionType() {
        if transaction.isExpense {
            transactionIconLabel.text = "|<"
            transactionIconBackground.backgroundColor = appSettings.startColor
            transactionTypeLabel.text = "Expense".localized
        } else {
            transactionIconLabel.text = ">|"
            transactionIconBackground.backgroundColor = appSettings.endColor
            transactionTypeLabel.text = "Income".localized
        }
        transactionIconBackground.layer.cornerRadius = transactionIconBackground.frame.height / 2
    }

    /// Fills the category view with data.
    private func configureTransactionCategory() {
        categoryBackground.layer.cornerRadius = categoryBackground.frame.height / 2
        guard let startColor = UIColor(hex: transaction.category.gradient.startColor),
              let endColor = UIColor(hex: transaction.category.gradient.endColor) else { return }
        categoryBackground.applyGradient(colours: [startColor, endColor])
        
        let imageName = transaction.category.categoryImage.name
        if let systemImage = UIImage(systemName: imageName){
            categoryImage.image = systemImage
        } else if let image = UIImage(named: imageName) {
            categoryImage.image = image.withRenderingMode(.alwaysTemplate)
        }
    }
    
    /// Fills `transactionNameLabel` and `transactionAmountLabel` fields.
    private func configureTransactionNameAndAmount(){
        transactionNameLabel.text = transaction.name
        transactionAmountLabel.text = String(transaction.amount)
    }
    
    /// Customization of appearance `finishButton`.
    private func configureFinishButton() {
        finishButton.backgroundColor = transactionIconBackground.backgroundColor
        finishButton.layer.cornerRadius = finishButton.frame.height / 4.5
        finishButton.layer.shadowColor = finishButton.backgroundColor?.cgColor
        finishButton.layer.shadowRadius = 10
        finishButton.layer.shadowOpacity = 0.2
    }
}
