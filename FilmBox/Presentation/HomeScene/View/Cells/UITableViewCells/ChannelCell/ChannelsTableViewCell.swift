//
//  ChannelsTableViewCell.swift
//  IbtikarTask
//
//  Created by Ahmed Ali on 27/11/2020.
//

import UIKit

class ChannelsTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var iconImageView: UIImageView! {
        didSet {
            iconImageView.layer.cornerRadius =  iconImageView.layer.frame.width / 2
        }
    }
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var headerTitleLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
    }
    
    // MARK: - Properties
    typealias ElementType = MediaCellRepresentable
    // MARK: - Properties

    var viewModel: ChannelCellRepresentable? {
        didSet {
            configureCell()
        }
    }
    
    var list: [ElementType] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}
// MARK: - Configure View
//

private extension ChannelsTableViewCell {
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsSelection = true
        collectionView.registerCellNib(SeriesCollectionViewCell.self)
        collectionView.registerCellNib(CourseCollectionViewCell.self)
    }
    
    func configureCell() {
        countLabel.text = viewModel?.countTitle
        headerTitleLabel.text = viewModel?.channelHeaderTitle
        iconImageView.setImage(representable: viewModel)
    }
    
}

// MARK: - UICollectionViewDataSource
//
extension ChannelsTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        list.count > 6 ? 6 : list.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        ///
        if viewModel?.cellType == .series {
            let cell = collectionView.dequeue(at: indexPath) as SeriesCollectionViewCell
            configureSeriesCell(cell, at: indexPath)
            return cell
        }
        let cell = collectionView.dequeue(at: indexPath) as CourseCollectionViewCell
        configureCourseCell(cell, at: indexPath)
        return cell

    }
    
}

// MARK: - UICollectionViewDataSource Conformance
//
extension ChannelsTableViewCell {
    
    func configureCourseCell(_ cell: CourseCollectionViewCell, at indexPath: IndexPath) {
        let item = list[indexPath.row]
        cell.viewModel = item
    }
    
    func configureSeriesCell(_ cell: SeriesCollectionViewCell, at indexPath: IndexPath) {
        let item = list[indexPath.row]
        cell.viewModel = item
    }

}

// MARK: - UICollectionViewDelegateFlowLayout
//
extension ChannelsTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if viewModel?.cellType == .series {
           return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
        }
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
private extension ChannelsTableViewCell {
    
    enum Constants {
        static let horizontalSpace = CGFloat(12)
        static let widthToHeightRatio = CGFloat(0.55)
    }
    
}
