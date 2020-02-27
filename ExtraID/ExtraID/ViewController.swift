//
//  ViewController.swift
//  ExtraID
//
//  Created by Iván Martínez on 30/01/20.
//  Copyright © 2020 Iván Martínez. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Elementos de UI
    
    @IBOutlet weak var studentsTableView: UITableView!
    
    var students = [Student]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Cconfigurar tableView
        studentsTableView.dataSource = self
        studentsTableView.delegate = self
        
        // Descargar datos
        let db = Firestore.firestore()
        
        db.collection("students").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Ocurrió un error: \(error.localizedDescription)")
            } else if let snapshot = querySnapshot {
                // Iterar los datos
                for studentData in snapshot.documents {
                    if let student = Student(studentData: studentData.data()) {
                        // Recargar TableView
                        self.students.append(student)
                        self.studentsTableView.reloadData()
                    }
                }
            }
        }
    }
    
    // UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: indexPath) as? StudentTableViewCell {
            
            // Configurar celda
            let student = students[indexPath.row]
            cell.configure(with: student)
            
            let url = URL(string: student.imageUrl)!
            ImageDownloader().downloadImage(from: url) { (image) in
                cell.profileImageView.image = image
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}

