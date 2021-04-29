//
//  Array+RandomSubset.swift
//  memorize
//
//  Created by Daniel Copley on 4/28/21.
//

import Foundation

extension Array {
    func randomSubset(size: Int) -> Array {
        return Array(self.shuffled()[..<size])
    }
}
