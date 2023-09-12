//
//  String.swift
//  Add 1
//
//  Created by Emilija Marija on 12.09.23.
//

import Foundation

extension String {
    static func randomNumber(lenght: Int) -> String {
        var result = ""
        
        for _ in 0..<lenght {
            let randomInt = Int.random(in: 1...8)
            let randomString = String(randomInt)
            
            result.append(randomString)
        }
        
        return result
    }
    
    func integer(at n: Int) -> Int {
        let index = self.index(self.startIndex, offsetBy: n)
        
        return self[index].wholeNumberValue ?? 0
    }
}
