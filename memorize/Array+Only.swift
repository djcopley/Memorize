//
//  Array+Only.swift
//  memorize
//
//  Created by Daniel Copley on 4/27/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
