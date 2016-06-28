//
//  MasaViewController.swift
//  PizzaDesdeIphone
//
//  Created by Oscar Javier Olivos on 24/06/16.
//  Copyright © 2016 Oscar Javier Olivos. All rights reserved.
//

import UIKit

class MasaViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var masaSeleccionada :String = ""
    var delegado: PizzaViewControllerDelegate?
    let tipoMasa = ["Delgada", "Crujiente", "Gruesa"]
    @IBOutlet weak var masaPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func cancelarButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func guardarButton(sender: UIBarButtonItem) {
        if(self.masaSeleccionada != ""){
            self.delegado?.setMasa!(self.masaSeleccionada)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tipoMasa.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tipoMasa[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        masaSeleccionada = tipoMasa [row]
    }

}
