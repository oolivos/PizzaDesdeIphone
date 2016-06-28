//
//  ViewController.swift
//  PizzaDesdeIphone
//
//  Created by Oscar Javier Olivos on 24/06/16.
//  Copyright © 2016 Oscar Javier Olivos. All rights reserved.
//

import UIKit



class ViewController: UIViewController, PizzaViewControllerDelegate {

    @IBOutlet weak var tamanoPizzaText: UITextField!
    
    @IBOutlet weak var tipoMasa: UITextField!
    @IBOutlet weak var tipoQueso: UITextField!
    @IBOutlet weak var tipoIngredientes: UITextView!
    
    var pizza =  Pizza(tamano: "", masa: "", queso: "", ingredientes: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelarPizza(sender: UIBarButtonItem) {
        self.resetInfo()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        switch segue.identifier! {
        case "tamano":
            let tamano = segue.destinationViewController as! TamanoViewController
            tamano.delegado = self
        case "masaSegue":
            let masa = segue.destinationViewController as! MasaViewController
            masa.delegado = self
        case "quesoSegue":
            let queso = segue.destinationViewController as! QuesoViewController
            queso.delegado = self
        case "ingredientesSegue":
            let ingredientes = segue.destinationViewController as! IngredientesViewController
            ingredientes.delegado = self
        case "cocinarSegue":
            let cocinar = segue.destinationViewController as! CocinarViewController
            cocinar.pizza = self.pizza
            cocinar.delegado = self
            //
        default:
            print("Segue indefine!!")
            
        }
        
        
        
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "cocinarSegue" {
            if(tamanoPizzaText.text != "" && tipoMasa.text != "" && tipoQueso.text != "" && tipoIngredientes.text != "" ){
                return true
            }else{
                
                let alert = UIAlertController(title: "Pizza", message: "Debe completar la configuracion de la Pizza", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: nil))
                self.self.presentViewController(alert,animated: true, completion: nil)
                return false
            }
        }
        return true
    }
    
    func setTamano(tamano: String) {
        self.tamanoPizzaText.text = tamano
        self.pizza.tamano = tamano
        
        
    }
    func setMasa(masa: String) {
        tipoMasa.text = masa
        pizza.masa = masa
    }
    func setQueso(queso: String) {
        tipoQueso.text = queso
        pizza.queso = queso
    }
    func setIngredientes(ingredientes: [String]) {
     
        var muestraIngredientes: String = ""
        for ingrediente in ingredientes {
            muestraIngredientes = muestraIngredientes + ", "+ingrediente
        }
        
        muestraIngredientes.removeAtIndex(muestraIngredientes.startIndex)
        tipoIngredientes.text = muestraIngredientes
        pizza.ingredientes = ingredientes
        
 
    }
    func resetInfo() {
        tamanoPizzaText.text = ""
        tipoMasa.text = ""
        tipoQueso.text = ""
        tipoIngredientes.text = "Ninguno"
        pizza.tamano = ""
        pizza.masa = ""
        pizza.queso = ""
        pizza.ingredientes = []
    }
    
    
  


}

