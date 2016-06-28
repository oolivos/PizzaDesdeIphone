//
//  TamanoViewController.swift
//  PizzaDesdeIphone
//
//  Created by Oscar Javier Olivos on 24/06/16.
//  Copyright © 2016 Oscar Javier Olivos. All rights reserved.
//
import UIKit


class TamanoViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    let tamanosPizza = ["Chica", "Mediana", "Grande"]
    
    var tamanoSeleccionado: String = ""
    @IBOutlet weak var tamanoPickerView: UIPickerView!
    var delegado: PizzaViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tamanoPickerView.dataSource = tamanosPizza
        
        
    }
    
    @IBAction func cancelarButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func aceptarButton(sender: UIBarButtonItem) {
        //pizza.setTamano("grandota")
        if(self.tamanoSeleccionado != ""){
            self.delegado?.setTamano!(self.tamanoSeleccionado)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tamanosPizza.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tamanosPizza[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tamanoSeleccionado = tamanosPizza[row]
    }
    
    
    
    
    
    
    
    
    
}
