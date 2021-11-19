

import XCTest
@testable import ReverseTheWords

class ReverseTheWordsTests: XCTestCase {
    
    func testReverseWords() {
        //Given
        let reverseManager = ReverseManager()
        let wordToReverse = "abc"
        let expectedResultAfterReverseWord = "cba"
        //When
        let resultToTesting = reverseManager.reverseTheWord(reverse: wordToReverse)
        //Then
        XCTAssertEqual(expectedResultAfterReverseWord, resultToTesting)
    }
}
