//
//  ViewController.swift
//  ReverseTheWords
//
//  Created by Серафима  Татченкова  on 17.11.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var wordLabelResult: UILabel!
    @IBOutlet weak var enterWordTextField: UITextField!
    
    var wordInfo = ""
    var reversedWord = ""
    var isClear = false
    
    @IBAction func reverseAction(_ sender: UIButton) {
        if isClear == false {
            reverseTheWord()
            sender.setTitle("Clear", for: .normal)
            isClear = true
        } else if isClear {
            clear()
            sender.setTitle("Reverse", for: .normal)
            isClear = false
        }
    }

    func reverseTheWord() {
        wordInfo = enterWordTextField.text!
        let parts = wordInfo.components(separatedBy: " ")
        let reversed = parts.map{String($0.reversed())}
        reversedWord = reversed.joined(separator: " ")
        printOutTheWord()
        hideTheKeyBoard()
    }
        
    func clear() {
        enterWordTextField.text = ""
        wordLabelResult.text = ""
        hideTheKeyBoard()
    }
    func printOutTheWord() {
        wordLabelResult.text = "\(reversedWord)"
    }
    func hideTheKeyBoard() {
        enterWordTextField.resignFirstResponder()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideTheKeyBoard()
    }
}


