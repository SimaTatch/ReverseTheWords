
import Foundation
import UIKit

class ExclusionRulesReverseManager {
    func reverseTheWords(toReverse: String) -> String {
        
        var words = toReverse.components(separatedBy: .whitespaces)

        for (index, word) in words.enumerated() {
            
            //Only letters
            if word.allSatisfy(\.isLetter) {
                words[index] = String(word.reversed())
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
            words[index] = String(reversed)
        }

        return words.joined(separator: " ")
    }
}

