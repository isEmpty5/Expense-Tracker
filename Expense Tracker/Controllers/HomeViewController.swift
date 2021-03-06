//
//  ViewController.swift
//  Expense Tracker
//
//  Created by isEmpty on 30.11.2020.
//

import UIKit
import CoreData

final class HomeViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var currencyLabel: UILabel!
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var incomeAmountLabel: UILabel!
    @IBOutlet private weak var expenseAmountLabel: UILabel!
    @IBOutlet private weak var topView: GradientView!
    @IBOutlet private weak var topViewConstraint: NSLayoutConstraint!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    //MARK: - Properties
    private let appSettings = AppSettings.shared
    private var balance: Balance!
    private var dataSource: UICollectionViewDiffableDataSource<Int, Transaction>!
    private var snapshot = NSDiffableDataSourceSnapshot<Int, Transaction>()
    private var fetchedResultsController: NSFetchedResultsController<Transaction>!
    
    //MARK: - Computed Properties
    private lazy var context: NSManagedObjectContext = {
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.container.viewContext
    }()
    
    //MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setup Data
        fetchBalance()
        setupFetchedResultsController()
        setupDataSource()
        
        //Configure UI
        configureCollectionView()
    }
}

//MARK: - Configure Layouts
extension HomeViewController {
    
    /// Reloads dusplaying all visible views.
    private func configureViews() {
        navigationController?.navigationBar.setGradientBackground(colors: [appSettings.startColor, appSettings.endColor], startPoint: .bottomLeft, endPoint: .topRight)
        (topView.startColor, topView.endColor) = (appSettings.startColor, appSettings.endColor)
        configureTopViewLabels()
        configureNavigationBar()
        topView.setNeedsDisplay()
    }
    
    /// Configure the `topView` display.
    /// Fills all field from `CoreData`.
    private func configureTopViewLabels() {
        currencyLabel.text = appSettings.currency.description
        amountLabel.text = String(format: appSettings.roundedFormat, balance.totalBalance)
        incomeAmountLabel.text = String(format: appSettings.roundedFormat, balance.income ?? 0)
        expenseAmountLabel.text = String(format: appSettings.roundedFormat, balance.expense ?? 0)
        
        let monthInt = Calendar.current.dateComponents([.month, .year], from: Date())
        let monthStr = Calendar.current.standaloneMonthSymbols[monthInt.month! - 1]
        dateLabel.text = "\(monthStr) \(monthInt.year!)"
    }
    
    /// Register `collectionView` cell. Assigning a delegate.
    private func configureCollectionView() {
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "homeCell")
        collectionView.collectionViewLayout = createCollectionViewLayout()
        collectionView.delegate = self
    }
    
    /// Configure the display of `UINavigationController`.
    private func configureNavigationBar(){
        let navLabel = UILabel()
        let navTitle = NSMutableAttributedString(string: "\(appSettings.currency) ", attributes:[
                                                    NSAttributedString.Key.foregroundColor: UIColor.white,
                                                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0),
                                                    NSAttributedString.Key.baselineOffset: 2])
        
        navTitle.append(NSMutableAttributedString(string: "\(balance.totalBalance)", attributes:[
                                                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22.0),
                                                    NSAttributedString.Key.foregroundColor: UIColor.white]))
        navLabel.attributedText = navTitle
        navigationItem.titleView = navLabel
    }
    
    /// Create `UICollectionViewCompositionalLayout` for `collectionView`.
    private func createCollectionViewLayout() -> UICollectionViewLayout {
        let sectionProvider = {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let spacing: CGFloat = 10
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(83))
            let itemCount = layoutEnvironment.container.effectiveContentSize.width >= 780 ? 2 : 1
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: itemCount)
            group.interItemSpacing = .fixed(spacing)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
            section.interGroupSpacing = spacing
            
            return section
        }
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }
}

//MARK: - Setup Data
extension HomeViewController {
    ///Gets `balance` from CoreData. If not already created, creates.
    private func fetchBalance() {
        let request: NSFetchRequest = Balance.fetchRequest()
        balance = try? context.fetch(request).first ?? Balance(context: context)
    }
    
    ///Setup `NSFetchedResultsController` which displays list of `Transactions`.
    private func setupFetchedResultsController() {
        let request: NSFetchRequest = Transaction.fetchRequest()
        
        let sort = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sort]
        switch appSettings.displaying {
        case .week:
            request.predicate = NSPredicate(format: "date > %@ AND date < %@", Date().startOfWeek as NSDate, Date().endOfWeek as NSDate)
        case .month:
            request.predicate = NSPredicate(format: "date > %@ AND date < %@", Date().startOfMonth as NSDate, Date().endOfMonth as NSDate)
        case .year:
            request.predicate = NSPredicate(format: "date > %@ AND date < %@", Date().startOfYear as NSDate, Date().endOfYear as NSDate)
        case .allTime: break
        }
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            showAlert(alertText: error.localizedDescription)
        }
    }
    
    /// Setup the `NSDiffableDataSourceSnapshot` which displays the current state of the UI.
    private func setupSnapshot() {
        snapshot = NSDiffableDataSourceSnapshot<Int, Transaction>()
        snapshot.appendSections([0])
        snapshot.appendItems(fetchedResultsController.fetchedObjects ?? [])
        configureTopViewLabels()
        configureNavigationBar()
        DispatchQueue.main.async {
            self.dataSource.apply(self.snapshot, animatingDifferences: true) {
                self.dataSource.apply(self.snapshot, animatingDifferences: false)
            }
        }
    }
    
    /// Setup the `UITableViewDiffableDataSource` with a cell provider that sets up the default `collectionView` cells.
    private func setupDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Int, Transaction>(collectionView: collectionView) {
            (collectionView, indexPath, transaction) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
            
            let startColor = UIColor(hex: transaction.category.gradient.startColor)
            let endColor = UIColor(hex: transaction.category.gradient.endColor)
            
            cell.configure(title: transaction.name,
                           date: transaction.date,
                           sum: String(format: self.appSettings.roundedFormat, transaction.amount),
                           isExpense: transaction.isExpense,
                           startColor: startColor,
                           endColor: endColor,
                           imageName: transaction.category.categoryImage.name)
            return cell
        }
        setupSnapshot()
    }
}

//MARK: - NSFetchedResultsControllerDelegate
extension HomeViewController: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        setupSnapshot()
    }
}

//MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
    ///Creates a context menu for `collectionView`.
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        guard let cellItemIdentifier = dataSource.itemIdentifier(for: indexPath) else { return nil }
        let identifier = NSString(string: "\(cellItemIdentifier.name)") // Use the image name for the identifier.
        return UIContextMenuConfiguration(identifier: identifier, previewProvider: nil, actionProvider: { suggestedActions in
            return UIMenu(title: "", children: [
                            self.recreateAction(indexPath),
                            self.changeTypeAction(indexPath),
                            self.changeAmountAction(indexPath),
                            self.changeCategoryAction(indexPath),
                            self.changeDateAction(indexPath),
                            self.deleteAction(indexPath)])
        })
    }
    
    /// Adds the ability to recreate a transaction
    private func recreateAction(_ indexPath: IndexPath) -> UIAction {
        return UIAction(title: "Recreate".localized,
                        image: UIImage(systemName: "square.and.pencil")) { action in
            let storyboard = UIStoryboard(name: Storyboards.transactionType, bundle: nil)
            guard let navController = storyboard.instantiateInitialViewController() as? UINavigationController else { return }
            guard let addingViewController = navController.topViewController as? TransactionTypeViewController else { return }
            addingViewController.transaction = self.dataSource.itemIdentifier(for: indexPath)
            addingViewController.creatingType = .recreate
            self.navigationController?.present(navController, animated: true, completion: nil)
        }
    }
    
    /// Adds the ability to change the type of transaction
    private func changeTypeAction(_ indexPath: IndexPath) -> UIAction {
        return UIAction(title: "Change Type".localized,
                        image: UIImage(systemName: "arrow.up.arrow.down")) { action in
            let storyboard = UIStoryboard(name: Storyboards.transactionType, bundle: nil)
            guard let navController = storyboard.instantiateInitialViewController() as? UINavigationController else { return }
            guard let addingViewController = navController.topViewController as? TransactionTypeViewController else { return }
            addingViewController.transaction = self.dataSource.itemIdentifier(for: indexPath)
            addingViewController.creatingType = .editing
            self.navigationController?.present(navController, animated: true, completion: nil)
        }
    }
    
    
    /// Adds the ability to change Amount and Description
    private func changeAmountAction(_ indexPath: IndexPath) -> UIAction {
        return UIAction(title: "Change Amount or Descrtiption".localized,
                        image: UIImage(systemName: "dollarsign.square")) { action in
            let storyboard = UIStoryboard(name: Storyboards.transactionAmount, bundle: nil)
            guard let controller = storyboard.instantiateInitialViewController() as? TransactionAmountViewController else { return }
            controller.transaction = self.dataSource.itemIdentifier(for: indexPath)
            controller.creatingType = .editing
            self.navigationController?.present(controller, animated: true, completion: nil)
        }
    }
    
    
    /// Adds the ability to change the category
    private func changeCategoryAction(_ indexPath: IndexPath) -> UIAction {
        return UIAction(title: "Change Category".localized,
                        image: UIImage(systemName: "eye")) { action in
            let storyboard = UIStoryboard(name: Storyboards.transactionCategory, bundle: nil)
            guard let addingViewController = storyboard.instantiateInitialViewController() as? TransactionCategoryViewController else { return }
            addingViewController.transaction = self.dataSource.itemIdentifier(for: indexPath)
            addingViewController.creatingType = .editing
            self.navigationController?.present(addingViewController, animated: true, completion: nil)
        }
    }
    
    /// Adds the ability to change the date
    private func changeDateAction(_ indexPath: IndexPath) -> UIAction {
        return UIAction(title: "Change Date".localized,
                        image: UIImage(systemName: "calendar")) { action in
            let storyboard = UIStoryboard(name: Storyboards.transactionDate, bundle: nil)
            guard let addingViewController = storyboard.instantiateInitialViewController() as? TransactionDateViewController else { return }
            addingViewController.transaction = self.dataSource.itemIdentifier(for: indexPath)
            self.navigationController?.present(addingViewController, animated: true, completion: nil)
        }
    }
    
    /// Adds the ability to delete `transactions`.
    private func deleteAction(_ indexPath: IndexPath) -> UIAction {
        return UIAction(title: "Delete".localized,
                        image: UIImage(systemName: "trash"),
                        attributes: .destructive) { action in
            guard let transaction = self.dataSource.itemIdentifier(for: indexPath) else { return }
            self.balance.totalBalance = transaction.isExpense ? self.balance.totalBalance + transaction.amount : self.balance.totalBalance - transaction.amount
            self.context.delete(transaction)
            try? self.context.save()
        }
    }
    
    ///Raises the `GradientView` depending on the scroll.
    ///When the `GradientView` is not fully visible, shows the `UINavigationController`.
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        
        // if scrollView bounces off the bottom
        guard !scrollView.isBouncingBottom else { return }
        // if scrollView bounces off the top
        guard !scrollView.isBouncingTop else {
            topViewConstraint.constant = 0
            return
        }
        
        let visibilityHeight: CGFloat = view.frame.height * 0.4
        
        // if topView is visible hide navigation bar
        if scrollView.contentOffset.y < visibilityHeight {
            topViewConstraint.constant = scrollView.contentOffset.y * -1
            self.navigationController?.navigationBar.isHidden = true
            UIView.animate(withDuration: 0.3) {
                self.navigationController?.navigationBar.alpha = 0
            }
        } else {
            self.navigationController?.navigationBar.isHidden = false
            topViewConstraint.constant = -visibilityHeight
            UIView.animate(withDuration: 0.3) {
                self.navigationController?.navigationBar.alpha = 1
            }
        }
    }
}
