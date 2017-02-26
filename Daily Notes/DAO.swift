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
	
	func deleteNote(index: Int){
		
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		let objectManager = appDelegate.persistentContainer.viewContext
		
		let requestForDelete = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
		
		let place = NSPredicate(format: "id == %@", "\(index)")
		
		requestForDelete.predicate = place
		
		do{
			let notes = try objectManager.fetch(requestForDelete)
			
			if notes.count > 0 {
				for notesA in notes as! [NSManagedObject]{
				
				objectManager.delete(notesA)
				
				}
			
			}

			try objectManager.save()
			print("Note deleted with sucess ! \(index)")
			
		}catch let error as NSError{
		
			print("Error in delete note \(error.description)")
		}
		
		
	}



}
