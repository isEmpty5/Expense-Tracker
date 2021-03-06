//
//  ChartViewController.swift
//  Expense Tracker
//
//  Created by isEmpty on 03.12.2020.
//

import UIKit
import CoreData

final class ChartViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var chartView: ChartView!
    @IBOutlet private weak var expenseView: ExpenseView!
    @IBOutlet private weak var incomeView: IncomeView!
    
    //MARK: - Properties
    private let appSettings = AppSettings.shared
    private var dataSource: UICollectionViewDiffableDataSource<Int, Date>!
    private var snapshot = NSDiffableDataSourceSnapshot<Int, Date>()
    private var fetchedResultsController: NSFetchedResultsController<Balance>!
    private var searchDate = Date().startOfMonth
    private var balance: Balance! {
        return fetchedResultsController.fetchedObjects?.first
    }
    
    //MARK: - Computed Properties
    private lazy var context: NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return (appDelegate?.container.viewContext)!
    }()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setup Data
        setupFetchedResultsController()
        setupDataSource()
        //Configure UI
        configureCollectionView()
    }
}

//MARK: - Setup Data
extension ChartViewController {
    /// Setup the `NSDiffableDataSourceSnapshot` which displays the current state of the UI.
    private func setupSnapshot() {
        snapshot = NSDiffableDataSourceSnapshot<Int, Date>()
        snapshot.appendSections([0])
        snapshot.appendItems(balance.getMonthList() ?? [])
        configureViews()
        configureLabels()
        configureChartView()
        DispatchQueue.main.async {
            self.dataSource?.apply(self.snapshot, animatingDifferences: true) {
                self.dataSource?.apply(self.snapshot, animatingDifferences: false)
            }
        }
    }
    
    /// Setup the `UITableViewDiffableDataSource` with a cell provider that sets up the default `collectionView` cells.
    /// Displays Month List.
    private func setupDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Int, Date>(collectionView: collectionView) {
            (collectionView, indexPath, date) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "monthCell", for: indexPath) as! MonthCollectionViewCell
            cell.configure(date)
            return cell
        }
        setupSnapshot()
    }
    
    private func setupFetchedResultsController() {
        let request: NSFetchRequest = Balance.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "totalBalance", ascending: false)]
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
            setupSnapshot()
        } catch {
            showAlert(alertText: error.localizedDescription)
        }
    }
}

//MARK: - NSFetchedResultsControllerDelegate
extension ChartViewController: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        setupSnapshot()
    }
}

//MARK: - Configure Layouts
extension ChartViewController {
    
    /// Reloads dusplaying all visible views.
    private func configureViews() {
        configureChartView()
        chartView.setNeedsDisplay()
        expenseView.setNeedsDisplay()
        incomeView.setNeedsDisplay()
        collectionView.visibleCells.forEach{$0.setNeedsDisplay()}
    }
    
    ///Refresh the data in the `ChartView`.
    private func configureChartView(){
        chartView.chartModel = balance.getTransactionsForMonth(searchDate)
        let currency = appSettings.currency.description
        chartView.currentBalance = currency + String(format: appSettings.roundedFormat, balance.totalBalance)
    }
    
    /// Refresh the data in the expense and income labels.
    private func configureLabels() {
        expenseView.transactionAmountLabel.text =
            appSettings.currency + String(format: appSettings.roundedFormat, balance.getExpenseForMonth(searchDate) ?? 0)
        incomeView.transactionAmountLabel.text =
            appSettings.currency + String(format: appSettings.roundedFormat, balance.getIncomeForMonth(searchDate) ?? 0)
    }
    
    /// Register `collectionView` cell. Assigning a delegate. Select current month.
    private func configureCollectionView() {
        collectionView.delegate = self
        let nib = UINib(nibName: "MonthCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "monthCell")
        
        DispatchQueue.main.async {
            let indexPath = self.dataSource.indexPath(for: self.searchDate)
            self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        }
    }
}

//MARK: - UICollectionViewDelegate
extension ChartViewController: UICollectionViewDelegate {
    
    ///Updates `chartView` and `expenseLabel` with `incomeLabel` depending on the selected `month`.
    ///Update `searchDate`.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        searchDate = item
        self.configureLabels()
        self.configureChartView()
    }
}
