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
    
    let japanPhoto: [JapanPhotoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        tableView.register(DailyJapanPhotosTVC.nib(), forHeaderFooterViewReuseIdentifier: DailyJapanPhotosTVC.identifier)
        
        AF.request(self.url, method: .get).responseDecodable(of: [JapanPhotoModel].self) { (response) in
            debugPrint(response)
        }
    }
}

extension DailyJapanPhotosVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyJapanPhotosTVC.identifier, for: indexPath) as! DailyJapanPhotosTVC
        
        return cell
    }
    
    
}


