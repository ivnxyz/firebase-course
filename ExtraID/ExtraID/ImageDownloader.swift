//
//  ImageDownloader.swift
//  ExtraID
//
//  Created by Iván Martínez on 05/02/20.
//  Copyright © 2020 Iván Martínez. All rights reserved.
//

import UIKit

struct ImageDownloader {
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL, completion: @escaping(UIImage?) -> Void) {
        // Empezar descarga
        getData(from: url) { data, response, error in
            // Obtener datos
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            // Regresar imagen
            DispatchQueue.main.async() {
                completion(UIImage(data: data))
            }
        }
    }
    
}
