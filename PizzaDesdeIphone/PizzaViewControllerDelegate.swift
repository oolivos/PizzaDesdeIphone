//
//  PizzaViewControllerDelegate.swift
//  PizzaDesdeIphone
//
//  Created by Oscar Javier Olivos on 24/06/16.
//  Copyright © 2016 Oscar Javier Olivos. All rights reserved.
//

import UIKit


 @objc protocol PizzaViewControllerDelegate: class {
    optional func setTamano(tamano: String)
    optional func setMasa(masa: String)
    optional func setQueso(queso : String)
    optional func setIngredientes(ingredientes: [String])
    optional func resetInfo()
    
}