//
//  IngredientesViewController.swift
//  PizzaDesdeIphone
//
//  Created by Oscar Javier Olivos on 25/06/16.
//  Copyright © 2016 Oscar Javier Olivos. All rights reserved.
//

import UIKit

class IngredientesViewController: UIViewController{

    var delegado: PizzaViewControllerDelegate?
    var cantidadIngredientes : Int = 0
    var ingredientesSeleccionados:[String] = []
    
    @IBAction func ingredientes(sender: AnyObject) {
        let check: UISwitch = sender as! UISwitch
        let ingredienteActual = sender.accessibilityIdentifier!
        //print(ingredienteActual!)
        
        if(check.on){
            if(cantidadIngredientes == 5){
                let alert = UIAlertController(title: "Pizza", message: "Maximo 5 Ingredientes!!", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: nil))
                self.self.presentViewController(alert,animated: true, completion: nil)
                check.setOn(false, animated: true)
            }else{
                cantidadIngredientes += 1;
                //print(cantidadIngredientes)
                ingredientesSeleccionados.append(ingredienteActual!)
            }
            
        }else{
            cantidadIngredientes -= 1;
            //print(cantidadIngredientes)
            let index: Int = (ingredientesSeleccionados.indexOf(ingredienteActual!))!
            //print(index)
            ingredientesSeleccionados.removeAtIndex(index)
        }
        
        
    }
    @IBAction func guardarButton(sender: UIBarButtonItem) {
        if(ingredientesSeleccionados.count > 0){
            self.delegado?.setIngredientes!(ingredientesSeleccionados)
            self.dismissViewControllerAnimated(true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Pizza", message: "Debe seleccionar al menos un ingrediente", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: nil))
            self.self.presentViewController(alert,animated: true, completion: nil)
        }
    }
    @IBAction func cancelarButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
