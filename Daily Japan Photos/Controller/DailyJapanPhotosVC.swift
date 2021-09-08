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
    
    let url = "https://pixabay.com/"
    let pages = "&per_page=50"
    let photo = "&q=japan&image_type=photo"
    
    private var japanPhoto: [Hit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(DailyJapanPhotosTVC.nib(), forCellReuseIdentifier: DailyJapanPhotosTVC.identifier)
        
        AF.request(self.url + "\(APIKey.pixabayAPIKey)" + "\(pages)" + "\(photo)", method: .get).responseDecodable(of: JapanPhotoModel.self) { [weak self] response in
            self?.japanPhoto = response.value?.hits ?? []
            self?.tableView.reloadData()
            debugPrint(response)
        }
    }
}

// MARK: - UITableViewDelegate
extension DailyJapanPhotosVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}

extension DailyJapanPhotosVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        japanPhoto.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: DailyJapanPhotosTVC.identifier, for: indexPath) as? DailyJapanPhotosTVC {
            cell.configureCell = japanPhoto[indexPath.row]
            return cell
        }
        return DailyJapanPhotosTVC()
    }
}


