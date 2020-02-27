//
//  ViewController.swift
//  FirebaseWorkshop
//
//  Created by Iván Martínez on 29/01/20.
//  Copyright © 2020 Iván Martínez. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Crear una instancia de la base de datos
        let db = Firestore.firestore()
        
        // Acceder a la colección
        let users = db.collection("users")
        
        // Acceder a la información
        users.getDocuments { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                // Acceder al usuario
                let documents = querySnapshot.documents
                
                print("***************************")

                for user in documents {
                    print(user.documentID)
                    print(user.data())
                }
            } else if let error = error {
                // Manejar error
                print(error)
            }
        }
        
        
        // Acceder a un documento
        users.document("Tn3E271rDKlttBDhGrrs").getDocument { (documentSnapshot, error) in
            print("***************************")
            let data = documentSnapshot?.data()
            print(data)
        }
        
        // Agregar documentos
        let userData = ["name": "Iván", "age": 19] as [String : Any]
        users.addDocument(data: userData)
        
        // Agregar nuevos datos
        let restaurantData = [
            "name": "El fogón",
            "location": [
                "lat": 1.3,
                "lng": 3.4
            ]
        ] as [String : Any]
        
        db.collection("restaurants").addDocument(data: restaurantData)
        
        // Observar datos
//        users.document("Tn3E271rDKlttBDhGrrs").addSnapshotListener { (documentSnapshot, error) in
//            print("Se actualizó el usuario")
//            print(documentSnapshot?.data())
//        }
        
        
        users.document("Tn3E271rDKlttBDhGrrs").updateData(["name": "Perla Sánchez"]) { (error) in
            print(error)
        }
    }


}

