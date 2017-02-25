//
//  ViewController.swift
//  Daily Notes
//
//  Created by Jhonatas Rodrigues on 23/02/17.
//  Copyright © 2017 Jhonatas Rodrigues. All rights reserved.
//

import UIKit


class NoteViewController: UIViewController {

	@IBOutlet var textNote: UITextView!
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.textNote.becomeFirstResponder()

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
	}

	@IBAction func saveNote(_ sender: Any) {
		let save = DAO()
		save.saveNote(text: textNote.text)
		
		_ = self.navigationController?.popToRootViewController(animated: true)
		
	}

}

