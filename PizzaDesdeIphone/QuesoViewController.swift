//
//  QuesoViewController.swift
//  PizzaDesdeIphone
//
//  Created by Oscar Javier Olivos on 25/06/16.
//  Copyright © 2016 Oscar Javier Olivos. All rights reserved.
//

import UIKit

class QuesoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var delegado: PizzaViewControllerDelegate?
    let tipoQuesos = ["Mozarella", "Cheddar", "Parmesano", "Sin Queso"]
    var quesoSeleccionado : String = ""
    
    @IBOutlet weak var quesoPicker: UIPickerView!
    @IBAction func guardarButton(sender: UIBarButtonItem) {
        if(self.quesoSeleccionado != ""){
            self.delegado?.setQueso!(self.quesoSeleccionado)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func cancelarButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
       override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tipoQuesos.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tipoQuesos[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        quesoSeleccionado = tipoQuesos[row]
    }

}
