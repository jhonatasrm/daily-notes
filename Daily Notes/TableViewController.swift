//
//  NoteListTableViewController.swift
//  Daily Notes
//
//  Created by Jhonatas Rodrigues on 23/02/17.
//  Copyright © 2017 Jhonatas Rodrigues. All rights reserved.
//

import UIKit
import CoreData

// class TableViewController to Daily Notes
class TableViewController: UITableViewController {
	
	let note = DAO()

    override func viewDidLoad() {
        super.viewDidLoad()

		note.listNote()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
		
    }

	override func viewDidAppear(_ animated: Bool) {
		
		note.listNote()
		self.tableView.reloadData()
	
	}

    override func numberOfSections(in tableView: UITableView) -> Int {
		
        return 1
    }

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		tableView.deselectRow(at: indexPath, animated: true)
		let annotation = note.notesA[indexPath.row]
		self.performSegue(withIdentifier: "note", sender: annotation)
		
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "note"{
			let noteView = segue.destination as! NoteViewController
			noteView.annotation = sender as? NSManagedObject
		}
	}
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		
        return note.notesA.count
    }
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		
		if editingStyle == UITableViewCellEditingStyle.delete{
			
			let noteToDelete = note.notesA[indexPath.row]
			note.noteToDelete = noteToDelete
			note.deleteNote(noteToDelete: note.noteToDelete)
			note.notesA.remove(at: indexPath.row)
			self.tableView.deleteRows(at: [indexPath], with:.fade)
	
		}
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
			let cel = tableView.dequeueReusableCell(withIdentifier: "myNotes", for: indexPath)
		
			let myNote = note.notesA[indexPath.row]
			
			let date = myNote.value(forKey: "date")
			let formateDate = DateFormatter()
			formateDate.dateFormat = "MM/dd/yyyy hh:mm"
			let newDate = formateDate.string(from: date as! Date)
		
			cel.textLabel?.text = myNote.value(forKey: "text") as? String
			cel.detailTextLabel?.text = newDate

		
			return cel
	}

}
