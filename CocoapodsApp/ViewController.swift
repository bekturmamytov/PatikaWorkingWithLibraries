//
//  ViewController.swift
//  CocoapodsApp
//
//  Created by Bektur Mamytov on 22/10/22.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    //MARK: -KingFisher
    
    func setImageViaKingFisher(url: String) {
        imageView.kf.setImage(with: URL(string: url))
    }
    
    //MARK: - SnapKit Usage
    func setConstraintsViaSnapKit() {
        redView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(256)
            make.height.equalTo(128)
        }
    }
    
    //MARK: - AutoLayout Constraints
    func setConstraintsViaAutoLayout() {
        redView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            redView.heightAnchor.constraint(equalToConstant: 128),
            redView.widthAnchor.constraint(equalToConstant: 256)
        ])
    }
    
    //MARK: - Alomofire usage
    func fetchWithAlomofire(url: String) {
        AF.request(url).response { response in
            debugPrint(response)
        }
    }
    
    //MARK: - URLSession usage
    func fetchWithUrlSession(url: String) {
        let url = URL(string: url)
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            //data
            guard let data = data else {
                return
            }
            print(String(data: data, encoding: .utf8) ?? "Data not found or not in correct format")
        }
        task.resume()
    }

}

