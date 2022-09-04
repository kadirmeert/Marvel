//
//  DetailViewController.swift
//  Marvel
//
//  Created by Mert on 4.09.2022.
//

import Foundation
import UIKit
import CryptoKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailİmage: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    
    var selectedmarvel = [Character]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.prepareUI()
    }
    
    func prepareUI() {
        
        
        //self.detailLabel.text = selectedmarvel
        //  self.movieImage.image = UIImage(named: self.selectedmarvel.image)
        
        
    }
    
}

