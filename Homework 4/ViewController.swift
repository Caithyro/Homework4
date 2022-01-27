//
//  ViewController.swift
//  Homework 4
//
//  Created by Дмитрий Куприенко on 12.12.2021.
//

import UIKit
import SDWebImage
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var resultsTableView: UITableView!
    public var dataArray: [Data] = Line.list
    public var numberOfMembers = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultsTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
        let requestUrl = "https://app.fakejson.com/q?token=7y5XGDDuBZNb4cuXvAkB1Q"
        let requestParameters: [String:[String: Any]] = [
            "data": [
                "name": "nameFirst",
                "image": "https://picsum.photos/200/200",
                "age": "numberInt",
                "_repeat": numberOfMembers
            ]
        ]
        
        AF.request(requestUrl, method:.post, parameters: requestParameters).responseJSON { [self]data1 in
            
            do {
                let defaultName = "Tony"
                let defaultAge = 42
                let defaultImage = "nil"
                var index1 = 0
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode([requestData].self, from: data1.data!)
                for _ in responseModel {
                    if index1 != numberOfMembers {
                        self.dataArray.append(Data(name: responseModel[index1].name ?? defaultName, image: responseModel[index1].image ?? defaultImage, age: responseModel[index1].age ?? defaultAge))
                        index1 += 1
                    }
                }
                self.resultsTableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = resultsTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell()}

        cell.selectionStyle = .none
        let item = dataArray[indexPath.row]
        cell.setupCell(item: item)
        
        
        return cell
    }
}
