//
//  Series+Representable.swift
//  FilmBox
//
//  Created by Ahmed Ali on 03/07/2022.
//

import UIKit

extension Series: SeriesCellRepresentable {
    
    var seriesTitle: String {
        title
    }
    
    var imageURL: String? {
        imagePath
    }
    
    var placeholderImage: UIImage? {
        .placeHolder
    }
    
    
}
