//
//  ViewController.swift
//  ByteCoin-Swift
//
//  Created by Mariola Hullings on 12/8/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let coinManager = CoinManager()
    
    //determines how many columns are in the picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //determines how many rows the picker will have
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //coinManager.currencyArray[row] prints the name of the currency
        let selectedCurrency = coinManager.currencyArray[row]
        //this passes the selected currency to the CoinManager via getCoinPrice() method
        coinManager.getCoinPrice(for: selectedCurrency)
        print(coinManager.currencyArray[row])
    }
    

    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        //sets the VC class as the delegate of the currencyPicker
        currencyPicker.delegate = self
    }


}

