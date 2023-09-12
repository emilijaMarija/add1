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
        
        for _ in 0...lenght {
            var randomInt = Int.random(in: 1...8)
            var randomString = String(randomInt)
            
            result.append(randomString)
        }
        
        return result
    }
}
