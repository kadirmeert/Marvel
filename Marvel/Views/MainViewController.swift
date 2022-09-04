//
//  MainViewController.swift
//  Marvel
//
//  Created by Kadır  Yıldız on 31.08.2022.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import CryptoKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: Properties
    private var marvelListViewModel : MarvelListViewModel!
    private var marvelDetailViewModel : MarvelDetailViewModel!
    private var detail = DetailViewController()
    var parser = WebService()
    var results = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
    }
    func getData() {
        parser.parse{
            data  in
            self.results = data!
            self.marvelListViewModel = MarvelListViewModel(results: self.results)
            self.marvelDetailViewModel = MarvelDetailViewModel(detailResults: self.results)
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let detailVC = segue.destination as? DetailViewController {
                if let marvel = sender as? DetailMarvelViewModel {
                    detailVC.detailLabel.text = marvel.marvel.name
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarvelCell", for: indexPath) as! MarvelTableViewCell
        let MarvelViewModel = self.marvelListViewModel.marvelAtIndex(indexPath.row)
        cell.marvelName.text = MarvelViewModel.name
        MarvelViewModel.image.stringToImage {(image) in
            cell.marvelImage.image = image
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMarvels = self.results[indexPath.item]
        self.performSegue(withIdentifier: "showDetail" , sender: selectedMarvels)
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}


