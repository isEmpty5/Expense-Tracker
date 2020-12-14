//
//  CreateCategoryViewController.swift
//  Expense Tracker
//
//  Created by isEmpty on 11.12.2020.
//

import UIKit
import CoreData

final class CreateCategoryViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var gradientCollectionView: UICollectionView!
    @IBOutlet private weak var imagesCollectionView: UICollectionView!
    
    
    //MARK: - Properties
    private lazy var context: NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return (appDelegate?.container.viewContext)!
    }()
    
    private var gradients = [Gradient]()
    private var images = [CategoryImage]()
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preloadDBData()
        loadGradientsAndImages()
        configureColorCollectionView()
        configureImageCollectionView()
    }
    
    
    //MARK: - Actions
    @IBAction private func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func saveTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Error", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        guard let name = titleTextField.text else { return }
        guard let selectedImageIndexPath = imagesCollectionView.indexPathsForSelectedItems?.first else { return }
        guard let selectedColorIndexPath = gradientCollectionView.indexPathsForSelectedItems?.first else { return }
        let category = Category(context: context)
        category.name = name
        category.categoryImage = images[selectedImageIndexPath.item]
        category.gradient = gradients[selectedColorIndexPath.item]
        try? context.save()
        dismiss(animated: true, completion: nil)
        
    }
}

//MARK: - Supporting Methods
extension CreateCategoryViewController {
    
    private func configureColorCollectionView() {
        let nib = UINib(nibName: "CircleColorCollectionViewCell", bundle: nil)
        gradientCollectionView.register(nib, forCellWithReuseIdentifier: "colorCell")
        gradientCollectionView.delegate = self
        gradientCollectionView.dataSource = self
        let indexPath = IndexPath(item: 0, section: 0)
        gradientCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
    }
    
    private func configureImageCollectionView() {
        let nib = UINib(nibName: "CircleImageCollectionViewCell", bundle: nil)
        imagesCollectionView.register(nib, forCellWithReuseIdentifier: "imageCell")
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        let indexPath = IndexPath(item: 0, section: 0)
        imagesCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
    }
    
    /// Loads data for `gradients` and `images`
    private func loadGradientsAndImages() {
        let gradientRequest: NSFetchRequest = Gradient.fetchRequest()
        gradients = try! context.fetch(gradientRequest)
        let imageRequest: NSFetchRequest = CategoryImage.fetchRequest()
        images = try! context.fetch(imageRequest)
    }
    
    /// Checks if data is loaded into CoreData.
    /// If the data is not loaded, then it loads it.
    private func preloadDBData() {
        if UserDefaults.standard.bool(forKey: "create_category.preload") == false {
            loadGradients()
            loadImages()
            UserDefaults.standard.set(true, forKey: "create_category.preload")
        }
    }
    
    /// Loads a list of gradients from `images.csv` to CoreData.
    private func loadImages() {
        guard let filePath = Bundle.main.path(forResource: "images", ofType: "csv") else { return }
        guard let str = try? String.init(contentsOfFile: filePath, encoding: .utf8) else { return }
        let images = parseImages(csvString: str)
        
        for item in images {
            let image = CategoryImage(context: context)
            image.name = item
            try? context.save()
        }
        
    }
    
    /// Splits a String into an array of Strings.
    private func parseImages(csvString: String) -> [String] {
        let lines: [String] = (csvString.components(separatedBy: NSCharacterSet.newlines) as [String])
            .filter{!$0.isEmpty}
        return lines
    }
    
    /// Loads a list of gradients from `gradients.csv` to CoreData.
    private func loadGradients() {
        guard let filePath = Bundle.main.path(forResource: "gradients", ofType: "csv") else { return }
        guard let str = try? String.init(contentsOfFile: filePath, encoding: .utf8) else { return }
        let gradients = parseGradients(csvString: str)
        
        for item in gradients {
            let gradient = Gradient(context: context)
            gradient.startColor = item.startColor
            gradient.endColor = item.endColor
            try? context.save()
        }
    }
    
    /// Splits a String into an array of Tuples.
    private func parseGradients(csvString: String) -> [(startColor: String, endColor: String)] {
        let lines: [String] = (csvString.components(separatedBy: NSCharacterSet.newlines) as [String])
            .filter{!$0.isEmpty}
        
        var gradients = [(startColor: String, endColor: String)]()
        
        lines.forEach { line in
            let gradient = line.split(separator: ";")
            let startColor = String(gradient[0])
            let endColor = String(gradient[1])
            gradients.append((startColor: startColor, endColor: endColor))
        }
        
        return gradients
    }
}

//MARK: - UICollectionViewDataSource & UICollectionViewDelegate
extension CreateCategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == gradientCollectionView {
            return gradients.count
        } else {
            return images.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == gradientCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorCell", for: indexPath) as! CircleColorCollectionViewCell
            cell.gradientLayer?.removeFromSuperlayer()
            cell.gradientLayer = cell.circleGradient?.applyGradient(colours: getGradientColors(for: indexPath))
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! CircleImageCollectionViewCell
            
            let imageName = images[indexPath.item].name!
            cell.imageView.image = nil
            cell.imageView.image = UIImage(systemName: imageName)
            
            guard let selectedIndexPath = gradientCollectionView.indexPathsForSelectedItems?.first else { return cell }
            cell.gradientLayer?.removeFromSuperlayer()
            cell.gradientLayer = cell.circleBackground?.applyGradient(colours: getGradientColors(for: selectedIndexPath))
            return cell
        }
    }
    
    private func getGradientColors(for indexPath: IndexPath) -> [UIColor] {
        let gradient = gradients[indexPath.item]
        guard let startColor = UIColor(hex: gradient.startColor!) else { return [] }
        guard let endColor = UIColor(hex: gradient.endColor!) else { return [] }
        return [startColor, endColor]
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == gradientCollectionView {
            guard let selectedIndexPath = imagesCollectionView.indexPathsForSelectedItems?.first else { return }
            imagesCollectionView.reloadData()
            imagesCollectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
        }
    }
}