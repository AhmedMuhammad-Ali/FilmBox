//
//  EpisodesTableViewCell.swift
//  IbtikarTask
//
//  Created by Ahmed Ali on 27/11/2020.
//

import UIKit

class EpisodesTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    typealias ElementType = EpisodeCellRepresentable
    
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

private extension EpisodesTableViewCell {
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsSelection = true
        collectionView.registerCellNib(EpisodeCollectionViewCell.self)
    }
}

// MARK: - UICollectionViewDataSource
//
extension EpisodesTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        list.count > 6 ? 6 : list.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(at: indexPath) as EpisodeCollectionViewCell
        configureEpisodeCell(cell, at: indexPath)
        return cell
    }
    
}

// MARK: - UICollectionViewDataSource Conformance
//
extension EpisodesTableViewCell {
    
    func configureEpisodeCell(_ cell: EpisodeCollectionViewCell, at indexPath: IndexPath) {
        let item = list[indexPath.row]
        cell.viewModel = item
    }
    
}
// MARK: - UICollectionViewDelegateFlowLayout
//
extension EpisodesTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.bounds.height
        let width = height * Constants.widthToHeightRatio
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.horizontalSpace
    }
    
}

// MARK: - Constants
//
private extension EpisodesTableViewCell {
    
    enum Constants {
        static let horizontalSpace = CGFloat(12)
        static let widthToHeightRatio = CGFloat(0.55)
    }
}
