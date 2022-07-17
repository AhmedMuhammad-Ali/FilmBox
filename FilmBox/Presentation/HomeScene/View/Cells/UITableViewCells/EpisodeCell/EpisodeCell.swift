//
//  EpisodeCell.swift
//  FilmBox
//
//  Created by Ahmed Ali on 03/07/2022.
//

import UIKit
import Kingfisher

class EpisodeCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var episodeImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

}
// MARK: - EpisodeCell + EpisodeCellView
extension EpisodeCell: EpisodeCellView {
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func setDescription(_ desc: String) {
        descriptionLabel.text = desc
    }
    
    func setImage(_ url: String) {
        let url = URL(string: url )
        episodeImageView.kf.setImage(with: url)
    }
}
