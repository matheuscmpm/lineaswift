//
//  ViewController.swift
//  LineaSwift
//
//  Created by Matheus Melo on 18/03/15.
//  Copyright (c) 2015 matheuscmpm. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DTDeviceDelegate {
    
    let scanner : DTDevices = DTDevices()
    
    @IBAction func conectionState(sender: UIButton) {
        
        if self.scanner.connstate == 2 {
            /*
                CONNECTED
            */
            self.stateLabel.text = "Connected"
        } else if self.scanner.connstate == 1{
            /*
                NOT CONNECTED AND WILL NOT TRY TO EITHER (Your accessory is probably not attached
            */
            self.stateLabel.text = "Not connected at all"
        } else {
            /*
                CONNECTING
            */
            self.stateLabel.text = "Trying to connect"
        }
        
    }
    
    @IBOutlet weak var stateLabel: UILabel!
    
    override func viewDidLoad() {
        self.stateLabel.text = "Trying to establish connection"
        self.scanner.delegate = self
        self.scanner.connect()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func barcodeData(barcode: String!, type: Int32) {
        var alert : UIAlertView = UIAlertView()
        alert.title = "Your barcode is"
        alert.message = barcode
        alert.addButtonWithTitle("Ok")
        alert.show()
    }


}

