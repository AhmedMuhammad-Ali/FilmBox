//
//  CategoryCollectionViewCell.swift
//  IbtikarTask
//
//  Created by Ahmed Ali on 27/11/2020.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets

    @IBOutlet private weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 20
        }
    }
    @IBOutlet private weak var categoryTitleLabel: UILabel!
    
    // MARK: - Properties

    var viewModel: CategoryCellRepresentable? {
        didSet {
            configureCell()
        }
    }
}

// MARK: - configure

extension CategoryCollectionViewCell {
    
    func configureCell() {
        categoryTitleLabel.text = viewModel?.categoryTitle
    }
}
