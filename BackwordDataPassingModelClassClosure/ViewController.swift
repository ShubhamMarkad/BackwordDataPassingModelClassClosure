//
//  ViewController.swift
//  BackwordDataPassingModelClassClosure
//
//  Created by Mac on 02/05/35.
//

import UIKit

class ViewController: UIViewController{
    

    @IBOutlet weak var StudentTabelView: UITableView!
    var secondViewController : SecondViewController?
    //var student : ((Student)->Void)?
    var students : [Student] = []
    //var student = [Student]?
    override func viewDidLoad() {
        super.viewDidLoad()
        registerWithXIB()
        StudentTabelView.delegate = self
        StudentTabelView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func moveToSVC(_ sender: Any) {
        let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController")as?SecondViewController
        secondViewController?.backDataPassingClosure = {studentObject in
            self.students.append(studentObject)
            self.StudentTabelView.reloadData()
        }
        navigationController?.pushViewController(secondViewController!, animated: true)
        
    }
    
    func registerWithXIB(){
       let uiNib = UINib(nibName: "StudentTableViewCell", bundle: nil)
        self.StudentTabelView.register(uiNib, forCellReuseIdentifier: "StudentTableViewCell")
    }
}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        200.0
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            StudentTabelView.beginUpdates()
            StudentTabelView.deleteRows(at: [indexPath], with: .fade)
            students.remove(at: indexPath.row)
            StudentTabelView.endUpdates()
        }
    }
    
}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studentTabelViewCell = self.StudentTabelView.dequeueReusableCell(withIdentifier: "StudentTableViewCell",for : indexPath)as!StudentTableViewCell
        studentTabelViewCell.rollNumberLabel.text = students[indexPath.row].rollNumber.codingKey.stringValue
        studentTabelViewCell.nameLabel.text = students[indexPath.row].name
        studentTabelViewCell.resultLabel.text = String(students[indexPath.row].result)
        studentTabelViewCell.persentageLabel.text = String(students[indexPath.row].persentage)
        return studentTabelViewCell
    }
    
    
}

