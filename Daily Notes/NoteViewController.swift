//
//  ViewController.swift
//  Daily Notes
//
//  Created by Jhonatas Rodrigues on 23/02/17.
//  Copyright © 2017 Jhonatas Rodrigues. All rights reserved.
//

import UIKit
import CoreData

class NoteViewController: UIViewController {

	let note = DAO()
	
	@IBOutlet var textNote: UITextView!
	var annotation: NSManagedObject!
	
	override func viewDidLoad(){
		super.viewDidLoad()

		self.textNote.becomeFirstResponder()
		
		if annotation != nil{
			
			textNote.text = annotation.value(forKey: "text") as! String!
		
		}else{
			
			textNote.text = ""
		
		}
		
	}
	
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
	}
	

	@IBAction func saveNote(_ sender: Any) {

		if annotation != nil{
			
			note.updateNote(text: self.textNote.text, annotation: annotation)
			
		}else{
			
			note.saveNote(text: textNote.text)
			
		}
		
		_ = self.navigationController?.popToRootViewController(animated: true)
		
	}

}

