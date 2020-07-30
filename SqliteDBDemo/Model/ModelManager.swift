//
//  ModelManager.swift
//  SqliteDBDemo
//
//  Created by Raju Gupta on 29/07/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import Foundation
import  UIKit

var shareInstance = ModelManager()

class ModelManager{
    
    var database : FMDatabase? = nil
    
    static func getInstance() -> ModelManager{
        if shareInstance.database == nil{
            shareInstance.database = FMDatabase(path: Util.share.getPath(dbName: "SqliteDB.db"))
        }
        return shareInstance
    }
    
    
    //MARK: - Saving data
    func SaveData(studentModel : StudentModel) -> Bool{
        shareInstance.database?.open()
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO student (name, mark) VALUES(?,?)", withArgumentsIn: [studentModel.name, studentModel.mark])
        shareInstance.database?.close()
        return isSave!
    }
    
    
    //MARK: - Get All Students data
    func getAllstudents() -> [StudentModel]{
        shareInstance.database?.open()
        //FMResultSet  :  Used to hold result of SQL query on FMDatabase object.
        let resultSet : FMResultSet! = try! shareInstance.database?.executeQuery("SELECT * FROM student", values: nil)
        var allStudents = [StudentModel]()
        
        if resultSet != nil{
            while resultSet.next() {
                let studentModel = StudentModel(id: resultSet.string(forColumn: "id")!, name: resultSet.string(forColumn: "name")!, mark: resultSet.string(forColumn: "mark")!)
                allStudents.append(studentModel)
            }
        }
        shareInstance.database?.close()
        return allStudents
    }
    
    
    //MARK: - Update Students data
    func updateStudent(student: StudentModel) -> Bool{
        shareInstance.database?.open()
        
        let isUpdated = shareInstance.database?.executeUpdate("UPDATE student SET name=?, mark=? WHERE id=? ", withArgumentsIn: [student.name,student.mark, student.id])
        
        shareInstance.database?.close()
        return isUpdated!
    }
    
    
    //MARK: - Deleting Students data
    func deleteStudent(student: StudentModel) -> Bool{
        shareInstance.database?.open()
        let isDeleted = (shareInstance.database?.executeUpdate("DELETE FROM student WHERE name=?", withArgumentsIn: [student.name]))
        shareInstance.database?.close()
        return isDeleted!
    }
}
