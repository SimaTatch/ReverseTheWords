

import Foundation
import UIKit

class IgnoreCommonWord {
    func reverseWords (toReverse: String, toIgnore: String) -> String {
        
        var wordsToReverse = toReverse.components(separatedBy: .whitespaces)
        for (index, word) in wordsToReverse.enumerated() {
            
            if word == toIgnore {
                wordsToReverse[index] = toIgnore
                continue
            }
            //Only letters
            if word.allSatisfy(\.isLetter) {
                wordsToReverse[index] = String(word.reversed())
                continue
            }

            //No letters
            if !word.contains(where: \.isLetter) { continue }
            

            //Mix
            var reversed = word.reversed().filter(\.isLetter)
            for (index, char) in word.enumerated() {
                if !char.isLetter {
                    index < reversed.endIndex ? reversed.insert(char, at: index) : reversed.append(char)
                }
            }
            wordsToReverse[index] = String(reversed)
        }

        return wordsToReverse.joined(separator: " ")
    }
}
