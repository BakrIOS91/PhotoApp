//
//  Array+Ext.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 08/04/2023.
//

import Foundation
extension Array {
    func insertingAdPlaceholder(_ adPlaceholder: Element, afterEveryNthElement n: Int) -> [Element] {
        var result = [Element]()
        
        for (index, element) in self.enumerated() {
            result.append(element)
            
            if (index + 1) % n == 0 && index != self.count - 1 {
                result.append(adPlaceholder)
            }
        }
        
        // Insert adPlaceholder at the end if necessary
                if self.count % 2 == 0 {
                    result.append(adPlaceholder)
                }
                
        
        return result
    }
}
