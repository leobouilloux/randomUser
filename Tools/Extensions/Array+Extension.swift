//
//  Array+Extension.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import Foundation

extension Array {
    public subscript(safeIndex index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}
