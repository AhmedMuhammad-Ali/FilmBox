//
//  CategoriesTableViewCell.swift
//  IbtikarTask
//
//  Created by Ahmed Ali on 27/11/2020.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    typealias ElementType = CategoryCellRepresentable
    
    var list: [ElementType] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
    }
}
// MARK: - Configure View
//

private extension CategoriesTableViewCell {
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsSelection = true
        collectionView.registerCellNib(CategoryCollectionViewCell.self)
    }
}

// MARK: - UICollectionViewDataSource
//
extension CategoriesTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count / 2
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(at: indexPath) as CategoryCollectionViewCell
        configureCategoryCell(cell, at: indexPath)
        return cell
    }
    
}

// MARK: - UICollectionViewDataSource Conformance
//
extension CategoriesTableViewCell {
    
    func configureCategoryCell(_ cell: CategoryCollectionViewCell, at indexPath: IndexPath) {
        let item = list[indexPath.row]
        cell.viewModel = item
    }
    
}
// MARK: - UICollectionViewDelegateFlowLayout
//
extension CategoriesTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.2, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.horizontalSpace
    }
    
}

// MARK: - Constantss
//
private extension CategoriesTableViewCell {

    enum Constants {
        static let horizontalSpace = CGFloat(12)
    }
}
