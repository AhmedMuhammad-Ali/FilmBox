//
//  EpisodeCollectionViewCell.swift
//  IbtikarTask
//
//  Created by Ahmed Ali on 28/11/2020.
//

import UIKit

class EpisodeCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    //
    @IBOutlet private weak var episodeDescriptionLabel: UILabel!
    @IBOutlet private weak var episodeTitleLabel: UILabel!
    @IBOutlet private weak var episodeImageView: UIImageView! {
        didSet {
            episodeImageView.layer.cornerRadius = 8
        }
    }
    
    // MARK: - Properties
    //
    var viewModel: EpisodeCellRepresentable? {
        didSet {
            configureCell()
        }
    }
}

// MARK: - configure

extension EpisodeCollectionViewCell {
    
    func configureCell() {
        episodeTitleLabel.text = viewModel?.episodeTitle
        episodeDescriptionLabel.text = viewModel?.episodeDescription
        episodeImageView.setImage(representable: viewModel)
    }
}
