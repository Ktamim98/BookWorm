//
//  DataController.swift
//  BookWorm
//
//  Created by Tamim Khan on 27/4/23.
//
import CoreData
import Foundation


class DataController: ObservableObject{
    let conteiner = NSPersistentContainer(name: "BookWorm")
    
    init(){
        conteiner.loadPersistentStores { description, error in
            if let error = error {
                print("core data failed to load: \(error.localizedDescription)")
            }
            
        }
    }
    
}
