//
//  DailyJapanPhotosVC.swift
//  Daily Japan Photos
//
//  Created by Matt Dolan External macOS on 2021-09-05.
//

import UIKit
import Alamofire

class DailyJapanPhotosVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let url = "https://pixabay.com/api/?key=23250900-37b6c2e019e67545c2686f55c&q=japan&image_type=photo"
    
    let japanPhoto: [JapanPhoto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request(self.url, method: .get).responseDecodable(of: [JapanPhoto].self) { (response) in
            debugPrint(response)
        }
    }
}


