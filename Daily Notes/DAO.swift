//
//  DAO.swift
//  Daily Notes
//
//  Created by Jhonatas Rodrigues on 23/02/17.
//  Copyright © 2017 Jhonatas Rodrigues. All rights reserved.
//

import UIKit
import CoreData

class DAO: UIViewController{
	
	var notesA: [NSManagedObject] = []
	var noteToDelete: NSManagedObject!
	
	func saveNote(text: String){
	
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		let objectManager = appDelegate.persistentContainer.viewContext
	
		let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: objectManager)
		

		note.setValue(text, forKey: "text")
		note.setValue(NSDate(), forKey: "date")

		
		do{
			
			try objectManager.save()
			print("Sucess !")
		
		}catch let error as NSError{
			
			print("Error while save note \(error.description)")
		
		}
		
		
	}
	
	func listNote(){
		
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		let objectManager = appDelegate.persistentContainer.viewContext
		
		let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
		
		do{
			
			let notes = try objectManager.fetch(request)
			self.notesA = notes as! [NSManagedObject]
			
			
		}catch let error as NSError{
		
			print("Error in list notes \(error.description)")
		}
	
	}
	
	func updateNote(text: String, annotation: NSManagedObject){
		
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		let objectManager = appDelegate.persistentContainer.viewContext
		
		annotation.setValue(text, forKey: "text")
		annotation.setValue(NSDate(), forKey: "date")

		do{
			try objectManager.save()
			print("Updated with sucess !")
		
		}catch{
			print("Fail to update data! ")
		
		}
	}
	
	func deleteNote(noteToDelete: NSManagedObject){
	
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		let objectManager = appDelegate.persistentContainer.viewContext
		
		objectManager.delete(noteToDelete)
		
		do{
			
			try objectManager.save()
			print("Note deleted with sucess !")
		
		}catch{
			
			print("Error in delete note !")
		
		}
		

	}
}
