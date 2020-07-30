//
//  ViewController.swift
//  SqliteDBDemo
//
//  Created by Raju Gupta on 28/07/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblView : UITableView!
    
    var studenst = [StudentModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        studenst = ModelManager.getInstance().getAllstudents()
        tblView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studenst.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        cell.lblName.text = studenst[indexPath.row].name
        cell.lblMarks.text = studenst[indexPath.row].mark
        cell.lblRollNo.text = studenst[indexPath.row].id
        cell.btnEdit.tag = indexPath.row
        cell.btnDelete.tag = indexPath.row
        cell.btnEdit.addTarget(self, action: #selector(onClickEdit(_:)), for: .touchUpInside)
        cell.btnDelete.addTarget(self, action: #selector(onClickDelete(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func onClickEdit(_ sender: UIButton){
        let vc = storyboard?.instantiateViewController(identifier: "AddStudentViewController") as! AddStudentViewController
        vc.studentModel = studenst[sender.tag]
        vc.headerTitle = "Update"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func onClickDelete(_ sender: UIButton){
        let isDeleted = ModelManager.getInstance().deleteStudent(student: studenst[sender.tag])
        studenst.remove(at: sender.tag)
        tblView.reloadData()
        print("isDeleted :- \(isDeleted)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 120
    }
}

