//
//  ViewController.swift
//  JeffreyWang-lab1
//
//  Created by Ziqian Wang on 9/12/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thatBlueThing: UIImageView!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var ogPriceEnter: UITextField!
    @IBOutlet weak var disEnter: UITextField!
    @IBOutlet weak var txEnter: UITextField!
    //creative
    @IBOutlet weak var peopleCountEnter: UITextField!
    @IBOutlet weak var splitBillLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    var output:Float = 0.0
    var OG:Float = 0.0
    var DS:Float = 0.0
    var TX:Float = 0.0
    //creative
    var splitOut:Float = 0.0
    var ppl:Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peopleCountEnter.text = String(ppl)
    }
    
    //Original Price
    
    @IBAction func OGtexting(_ sender: Any) {
        OG = Float(ogPriceEnter.text ?? "not a number") ?? 0.0
        OG = abs(OG)
        OG = round(OG * 100) / 100.0
        output = (OG-(OG*(DS/100)))+((OG-(OG*(DS/100)))*(TX/100))
        output = round(output * 100)/100.0
        outputLabel.text = String(output)
    }
    @IBAction func roundOG(_ sender: Any) {
        ogPriceEnter.text = String(OG)
    }
    
    //Discount
    @IBAction func DXtexting(_ sender: Any) {
        DS = Float(disEnter.text ?? "not a number") ?? 0.0
        DS = abs(DS)
        if (DS>100){
            DS = 100
        }
        output = (OG-(OG*(DS/100)))+((OG-(OG*(DS/100)))*(TX/100))
        output = round(output * 100)/100.0
        outputLabel.text = String(output)
    }
    @IBAction func DSAfterText(_ sender: Any) {
        disEnter.text = String(DS)
    }
    
    //Sales Tax
    @IBAction func TXtexting(_ sender: Any) {
        TX = Float(txEnter.text ?? "not a number") ?? 0.0
        TX = abs(TX)
        if (TX>100){
            TX = 100
        }
        output = (OG-(OG*(DS/100)))+((OG-(OG*(DS/100)))*(TX/100))
        output = round(output * 100)/100.0
        outputLabel.text = String(output)
    }
    @IBAction func TXAfterText(_ sender: Any) {
        txEnter.text = String(TX)
    }
    
    //Split Bill
    @IBAction func splitBillEntering(_ sender: Any) {
        ppl = Int(peopleCountEnter.text ?? "not a number") ?? 1
        splitOut = Float(output/Float(ppl))
        splitOut = round(splitOut * 100)/100.0
        splitBillLabel.text = String(splitOut)
    }
    @IBAction func plusPushed(_ sender: Any) {
        ppl += 1
        peopleCountEnter.text = String(ppl)
        splitOut = Float(output/Float(ppl))
        splitOut = round(splitOut * 100)/100.0
        splitBillLabel.text = String(splitOut)
    }
    @IBAction func minusPushed(_ sender: Any) {
        ppl -= 1
        peopleCountEnter.text = String(ppl)
        splitOut = Float(output/Float(ppl))
        splitOut = round(splitOut * 100)/100.0
        splitBillLabel.text = String(splitOut)
    }
    
    
    
}
