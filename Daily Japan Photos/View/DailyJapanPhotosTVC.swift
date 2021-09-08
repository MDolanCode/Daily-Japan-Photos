//
//  DailyJapanPhotosTVC.swift
//  Daily Japan Photos
//
//  Created by Matt Dolan External macOS on 2021-09-05.
//

import UIKit

class DailyJapanPhotosTVC: UITableViewCell {

    @IBOutlet var japanPhotoImageView: UIImageView!
    
    static let identifier = "DailyJapanPhotosTVC"
    
    static func nib() -> UINib {
        return UINib(nibName: DailyJapanPhotosTVC.identifier, bundle: nil)
    }
    
    var configureCell: Hit! {
        didSet {
            self.japanPhotoImageView.setImage(imageURL: self.configureCell.largeImageURL)
        }
    }
}
