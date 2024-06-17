//
//  Array+Extensions.swift
//  RubiksCube
//
//  Created by Oscar Berggren on 2024-06-16.
//

import Foundation

extension Array {
    subscript(safely index: Int) -> Element? {
        if index < count && index >= 0 {
            return self[index]
        }

        return nil
    }

    func rotate2DArray<T>(clockwise: Bool) -> [[T]] where Element == [T]  {
        var rotated = self
        let count = self.count

        for i in 0..<count {
            for j in 0..<count {
                if clockwise {
                    rotated[j][count-1-i] = self[i][j]
                } else {
                    rotated[count-1-j][i] = self[i][j]
                }
            }
        }
        
        return rotated
    }
}
