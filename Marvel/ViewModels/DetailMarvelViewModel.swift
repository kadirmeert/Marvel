//
//  DetailMarvelViewModel.swift
//  Marvel
//
//  Created by Mert on 4.09.2022.
//

import Foundation
import UIKit

struct MarvelDetailViewModel {
    var detailResults = [Character]()
    
    func numberOfRowSection() -> Int {
        return self.detailResults.count
    }
    
    func marvelAtIndex(_ index: Int) -> DetailMarvelViewModel {
        let marvels = self.detailResults[index]
        return DetailMarvelViewModel(marvel: marvels)
    }
}
struct DetailMarvelViewModel {
    let marvel : Character
    
    var name : String {
        return self.marvel.name
    }
    
    var modified : String {
        
        return self.marvel.modified
    }
    var image : String {
        let path = marvel.thumbnail["path"] ?? ""
        let ext = marvel.thumbnail["extension"] ?? ""
        let marvelİmage = "\(path).\(ext)"
        
        return marvelİmage
    }
}

