//
//  ViewController.swift
//  ReverseTheWords
//
//  Created by Серафима  Татченкова  on 17.11.2021.
//

import Foundation
import UIKit

class ReverseManager {
    func reverseTheWord(reverse: String) -> String {
        let parts = reverse.components(separatedBy: " ")
        let reversed = parts.map{String($0.reversed())}
        let reversedWord = reversed.joined(separator: " ")
        
        return reversedWord
    }
}
