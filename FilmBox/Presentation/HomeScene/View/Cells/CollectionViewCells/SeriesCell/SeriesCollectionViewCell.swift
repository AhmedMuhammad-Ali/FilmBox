//
//  SeriesCollectionViewCell.swift
//  IbtikarTask
//
//  Created by Ahmed Ali on 27/11/2020.
//

import UIKit

class SeriesCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var seriesImageView: UIImageView!
    @IBOutlet private weak var seriesTitleLable: UILabel!
    
    // MARK: - Properties

    var viewModel: SeriesCellRepresentable? {
        didSet {
            configureCell()
        }
    }
}
// MARK: - Configure

extension SeriesCollectionViewCell {
    func configureCell() {
        seriesTitleLable.text = viewModel?.seriesTitle
        seriesImageView.setImage(representable: viewModel)
    }
}
