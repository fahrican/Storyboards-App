//
//  DetailTableViewController.swift
//  RatingsTutorial
//
//  Created by fahri on 04.07.18.
//  Copyright © 2018 fahri. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    //Here we declcare the connections for the 'Edit row' scene.
    @IBOutlet weak var editNameField: UITextField!
    
    @IBOutlet weak var editGameField: UITextField!
    
    @IBOutlet weak var editStarsField: UITextField!
    
    var index:Int?
    
    var modelArray:[Player]!
    
    var editedModel:Player?
    
    //Here we save the properties of a Player instance and asign the properties to our connected UITextFields.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editNameField.text = modelArray[index!].name
        editGameField.text = modelArray[index!].game
        editStarsField.text = String(modelArray[index!].rating)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            editNameField.becomeFirstResponder()
        }
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var myRating = 1
        if let rating = Int(editStarsField.text!) {
            myRating = rating
        }
        //Here we store the edited properties from the Player instance before and asign them to 'editedModel'.
        if segue.identifier == "save" {
            editedModel = Player(name: editNameField.text, game: editGameField.text, rating: myRating)
        }
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    
    
}
