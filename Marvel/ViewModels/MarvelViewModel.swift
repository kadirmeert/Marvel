//
//  MarvelViewModel.swift
//  Marvel
//
//  Created by Kadır  Yıldız on 31.08.2022.
//

import Foundation
import UIKit

 struct MarvelListViewModel {
     var results = [Character]()

    func numberOfRowSection() -> Int {
        return self.results.count
    }

    func marvelAtIndex(_ index: Int) -> MarvelViewModel {
        let marvels = self.results[index]
        return MarvelViewModel(marvel: marvels)
    }
}


struct MarvelViewModel {
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

