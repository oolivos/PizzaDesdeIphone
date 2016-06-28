//
//  CocinarViewController.swift
//  PizzaDesdeIphone
//
//  Created by Oscar Javier Olivos on 27/06/16.
//  Copyright © 2016 Oscar Javier Olivos. All rights reserved.
//

import UIKit

class CocinarViewController: UIViewController {
    
    var pizza: Pizza!
    var delegado : PizzaViewControllerDelegate?
    
    @IBOutlet weak var tamano: UILabel!
    
    @IBOutlet weak var masa: UILabel!
    
    @IBOutlet weak var ingredientes: UILabel!
    @IBOutlet weak var queso: UILabel!
    
    override func viewDidLoad() {
        tamano.text = pizza.tamano
        masa.text = pizza.masa
        queso.text = pizza.queso
        var muestraIngredientes: String = ""
        for ingrediente in pizza.ingredientes {
            muestraIngredientes = muestraIngredientes + ", "+ingrediente
        }
        
        muestraIngredientes.removeAtIndex(muestraIngredientes.startIndex)
        ingredientes.text = muestraIngredientes
    }
    @IBAction func aceptarCocinar(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Pizza", message: "Seguro que desea procesar el pedido??", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction) in
            self.delegado?.resetInfo!()
            //self.dismissViewControllerAnimated(true, completion: nil)
            self.empezarACocinar()
        
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.Default, handler: nil))
        
        self.self.presentViewController(alert,animated: true, completion: nil)
        
        
    }
    
    @IBAction func cancelarCocinar(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func empezarACocinar() {
        let alert = UIAlertController(title: "Pizza", message: "Su pedido ha sido procesado, Gracias por preferirnos :)", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction) in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
            
        }))
        self.self.presentViewController(alert,animated: true, completion: nil)
        
    }
}
