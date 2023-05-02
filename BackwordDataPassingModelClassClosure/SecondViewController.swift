//
//  SecondViewController.swift
//  BackwordDataPassingModelClassClosure
//
//  Created by Mac on 02/05/35.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var rollNumberTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var resultTextField: UITextField!
    @IBOutlet weak var persentageTextField: UITextField!
    var backDataPassingClosure : ((Student)->Void)?
    var rollNumber : Int?
    var name : String?
    var result : Double?
    var persentage : Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func moveToFVC(_ sender: Any) {
        rollNumber = self.rollNumberTextField.text!.codingKey.intValue
        name = self.nameTextField.text!
        result = Double(self.resultTextField.text!)
        persentage = Float(self.persentageTextField.text!)
        guard let backDataPass = backDataPassingClosure else { return  }
        let studentObject = Student(rollNumber: rollNumber!, name: name!, result: result!, persentage: persentage!)
        backDataPass(studentObject)
        navigationController?.popViewController(animated: true)
    }
}
