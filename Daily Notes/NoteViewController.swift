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
	var anotation: NSManagedObject!
	

	
	
	override func viewDidLoad(){
		super.viewDidLoad()
		
		self.textNote.becomeFirstResponder()
		
		if anotation != nil{
			textNote.text = anotation.value(forKey: "text") as! String!
		
		}else{
			textNote.text = ""
		
		}
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
	}
	


	@IBAction func saveNote(_ sender: Any) {
		
		note.saveNote(text: textNote.text)
		
		_ = self.navigationController?.popToRootViewController(animated: true)
		
	}

}

