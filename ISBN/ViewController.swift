//
//  ViewController.swift
//  ISBN
//
//  Created by Seba Benavides on 21-11-15.
//  Copyright © 2015 Seba Benavides. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textoIsbn: UITextField!
    @IBOutlet weak var visorResultado: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        func sincrono(){
            let isbn = textoIsbn.text
            let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(isbn!)"
            let url = NSURL(string: urls)
            let datos:NSData? = NSData(contentsOfURL: url!)
            
            if datos == nil{
                let alerta = UIAlertController(title: "Alerta", message: "No dispones de conexion a internet", preferredStyle: .Alert)
            alerta.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
                self.presentViewController(alerta, animated: true, completion: nil)
            }else{
                let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
                visorResultado.text = String(texto)
            }}
        
        
    
    @IBAction func searchTextField(sender: UITextField) {
    if textoIsbn == ""{
    let alerta = UIAlertController(title: "Cuidado", message: "Ingrese un ISBN", preferredStyle: .Alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alerta
            , animated: true, completion: nil)
    }else{
        sincrono()
        sender.resignFirstResponder()
        }
        }
    @IBAction func desaparecerTeclado(sender: AnyObject){
        textoIsbn.resignFirstResponder()
        visorResultado.resignFirstResponder()

}
    
    @IBAction func limpiar(sender: UIButton) {
        textoIsbn.text = String()
        visorResultado.text = String()
    }
}


