//
//  CourseCollectionViewCell.swift
//  IbtikarTask
//
//  Created by Ahmed Ali on 27/11/2020.
//

import UIKit

class CourseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var couresTitleLabel: UILabel!
    @IBOutlet private weak var courseImageView: UIImageView!
    
    // MARK: - Properties
    
    var viewModel: MediaCellRepresentable? {
        didSet {
            configureCell()
        }
    }
}

// MARK: - configure

extension CourseCollectionViewCell {
    
    func configureCell() {
        couresTitleLabel.text = viewModel?.channelTitle
        courseImageView.setImage(representable: viewModel)
    }
}
