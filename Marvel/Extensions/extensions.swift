//
//  extensions.swift
//  Marvel
//
//  Created by Mert on 4.09.2022.
//

import Foundation
import UIKit

extension UIView {

    func dropShadow(cornerRadius: CGFloat) {
       layer.cornerRadius = cornerRadius
       layer.masksToBounds = false
       layer.shadowColor = UIColor.darkGray.cgColor
       layer.shadowOpacity = 0.1
       layer.shadowOffset = CGSize(width: 0, height: 0)
       layer.shadowRadius = 10
   }
    
}
extension String {

       func stringToImage(_ handler: @escaping ((UIImage?)->())) {
           if let url = URL(string: self) {
               URLSession.shared.dataTask(with: url) { (data, response, error) in
                   if let data = data {
                       DispatchQueue.main.async {
                           let image = UIImage(data: data)
                           handler(image)
                       }
                   }
               }.resume()
           }
       }
   }
    


