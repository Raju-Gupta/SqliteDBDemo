//
//  AddStudentViewController.swift
//  SqliteDBDemo
//
//  Created by Raju Gupta on 29/07/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController {

    @IBOutlet weak var txtName : UITextField!
    @IBOutlet weak var txtMarks : UITextField!
    var studentModel : StudentModel?
    var headerTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if headerTitle != ""{
            self.title = "\(headerTitle) Student"
            txtName.text = studentModel?.name
            txtMarks.text = studentModel?.mark
        }
    }
    
    @IBAction func onClickSava(_ sender: UIButton){
        if headerTitle != ""{
            let student = StudentModel(id: studentModel!.id, name: txtName.text!, mark: txtMarks.text!)
            let isUpdate = ModelManager.getInstance().updateStudent(student: student)
            print("isUpdate :- \(isUpdate)")
        }
        else{
            let student = StudentModel(id: "", name: txtName.text!, mark: txtMarks.text!)
            let isSave = ModelManager.getInstance().SaveData(studentModel: student)
            print("isSave :- \(isSave)")
        }
    }

}
