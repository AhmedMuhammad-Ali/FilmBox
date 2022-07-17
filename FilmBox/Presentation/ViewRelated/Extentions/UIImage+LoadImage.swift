//
//  UIImage+LoadImage.swift
//  FilmBox
//
//  Created by Ahmed Ali on 28/11/2020.
//

import UIKit
import Kingfisher

// MARK: - ImageLoader
//
protocol ImageLoader {
    
    /// Set image using url as string and placeholder image in case of failure to fetch the image
    func setImage(urlString: String?, placeholder: UIImage?)
    
    /// Set image using `ImageRepresentable` item
    func setImage(representable: ImageRepresentable?)
}

// MARK: - UIImageView + ImageLoader Conformance
//
extension UIImageView: ImageLoader {
    
    func setImage(urlString: String?, placeholder: UIImage?) {
        let url = URL(string: urlString ?? "")
        self.kf.setImage(with: url, placeholder: placeholder)
    }
    
    func setImage(representable: ImageRepresentable?) {
        setImage(urlString: representable?.imageURL,
                 placeholder: representable?.placeholderImage)
    }
}
