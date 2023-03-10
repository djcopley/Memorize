//
//  Array+Identifiable.swift
//  memorize
//
//  Created by Daniel Copley on 4/27/21.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if matching.id == self[index].id {
                return index
            }
        }
        return nil
    }
}
