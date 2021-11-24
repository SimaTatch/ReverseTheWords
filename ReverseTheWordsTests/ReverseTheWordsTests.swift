

import XCTest
@testable import ReverseTheWords

class ReverseTheWordsTests: XCTestCase {
    
    func testReverseWords() {
        //Given
        let reverseManager = ReverseManager()
        let wordToReverse = "abc"
        let expectedResultAfterReverseWord = "cba"
        //When
        let testResult = reverseManager.reverseTheWord(reverse: wordToReverse)
        //Then
        XCTAssertEqual(expectedResultAfterReverseWord, testResult)
    }
    
    func testWithExclusionRulesIgnoringCommonWord() {
        let reverseAndIgnoringCommonWord = IgnoreCommonWord()
        let wordToReverse = "Fox1minded is coo2l 24/7"
        let commonWord = "Fox1minded is"
        let expectedResult = "Fox1minded is loo2c 24/7"
        
        let testResult = reverseAndIgnoringCommonWord.reverseWords(toReverse: wordToReverse, toIgnore: commonWord)
        XCTAssertEqual(expectedResult, testResult)
    }
    

}
