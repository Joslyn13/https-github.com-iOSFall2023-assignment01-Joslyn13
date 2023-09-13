//
//  PlayWithAlphaNumVC.swift
//  PlayWithAlphaNumericsApp
//
//  Created by Raajitha Vardhanapu on 9/12/23.
//

import UIKit

class PlayWithAlphaNumVC: UIViewController {

    @IBOutlet weak var headerLBL: UILabel!
    
    
    @IBOutlet weak var numberSWCH: UISwitch!
    @IBOutlet weak var firstNumLBL: UILabel!
    
    
    @IBOutlet weak var secondNumLBL: UILabel!
    @IBOutlet weak var firstStrTF: UITextField!
    
    @IBOutlet weak var secondStrTF: UITextField!
    
    
    @IBOutlet weak var stringSWCH: UISwitch!
    @IBAction func numberSWCH(_ sender: UISwitch) {
        if numberSWCH.isOn{
            generatePattern.isEnabled = true
        }
        else{
            generatePattern.isEnabled = false
        }
    
    }
    
    @IBAction func stringSWCH(_ sender: UISwitch) {
        if stringSWCH.isOn{
            manipulateString.isEnabled = true
        }
        else{
            manipulateString.isEnabled = false
        }
        
    }
    
    
    @IBOutlet weak var generatePattern: UIButton!
    
    @IBOutlet weak var manipulateString: UIButton!
    
    @IBAction func firstNumStepper(_ sender: UIStepper) {
        firstNumLBL.text = String(Int(sender.value))
    }
    
    @IBAction func secondNumStepper(_ sender: UIStepper) {
        secondNumLBL.text = String(Int(sender.value))
    }
    @IBOutlet weak var messageTV: UITextView!
    
    
    // Generate Patterns
    @IBAction func generatePattern(_ sender: UIButton) {
        
        var generatePattern = ""
                if let numRows = Int(firstNumLBL.text ?? "0"),
                   let numColumns = Int(secondNumLBL.text ?? "0") {
                   
                    
                    for rowPattern in 1...numRows {
                                for columnPattern in 1...numColumns {
                                    if rowPattern == 1 || rowPattern == numRows || columnPattern == 1 || columnPattern == numColumns {
                                        generatePattern += "❄️"
                                    } else {
                                        generatePattern += "🎅"
                                    }
                                }
                        generatePattern += "\n" // Move to the next line after printing each row
                            }
                    }
                messageTV.text=generatePattern
                
        }
        
            
        
        
        

    
    @IBAction func manipulateStrings(_ sender: UIButton) {
        if let value1 = firstStrTF.text, let value2 = secondStrTF.text {
                    // Concatenate the text from both text fields
                    let concate = value1 + value2
                    var vowelchar=0
                    let vowelsRes: Set<Character> = Set("aeiouAEIOU")
                    for char in concate{
                        if vowelsRes.contains(char) {
                            vowelchar += 1
                                }
                        
                    }
                    let consonantchar = concate.count-vowelchar
                    var uniquechar = Set<Character>()
                    for z in concate {
                        uniquechar.insert(z)
                        }
                    var reversedchar = ""
                    for y in concate{
                        reversedchar = String(y) + reversedchar
                    }
                    
            messageTV.text = "Concatenation of two strings results in \(concate) \n Number of vowels in \(concate) is \(vowelchar) \n Number of consonants in \(concate) is \(consonantchar) \n Number of unique characters in \(concate) is \(uniquechar.count) \n The reversal of \(concate) results in \(reversedchar)"
            
            
                }
                else{
                    messageTV.text="message cannot be empty"
                }
        
        
    }
    
    @IBAction func onReset(_ sender: UIButton) {
        
        firstStrTF.text = " "
        secondStrTF.text = " "
        messageTV.text=""
        firstNumLBL.text = ""
        secondNumLBL.text = ""
    }
    
    
    @IBOutlet weak var onReset: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.headerLBL.text = String(format: "%@\nPlay with AlphaNumerics™️", "\u{0c38}\u{0c4d}\u{0c35}\u{0c3e}\u{0c17}\u{0c24}\u{0c02}")
        
        generatePattern.isEnabled = false
        manipulateString.isEnabled = false
        numberSWCH.isOn = false
        stringSWCH.isOn = false
        onReset.isEnabled = true
                

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation
// hai
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
