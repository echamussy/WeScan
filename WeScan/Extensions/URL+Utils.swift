//
//  URL+Utils.swift
//  WeScan
//
//  Created by Juan Luis Montero Roca on 19/05/2020.
//  Copyright © 2020 WeTransfer. All rights reserved.
//

import Foundation

extension URL {
    func saveImage(image: UIImage?) -> URL? {
        if let jpgRepresentation = image?.jpegData(compressionQuality: 1.0) {
            do  {
                try jpgRepresentation.write(to: self,
                                            options: .atomic)
                return self
            } catch let err {
                print("Saving file resulted in error: ", err)
            }
        }
        return nil
    }
    
    func retrieveImage() -> UIImage? {
        if let fileData = FileManager.default.contents(atPath: path), let image = UIImage(data: fileData)?.withFixedOrientation() {
            return image
        }
        return nil
    }
}
