//
//  DetailTableViewController.swift
//  RatingsTutorial
//
//  Created by fahri on 04.07.18.
//  Copyright © 2018 fahri. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    @IBOutlet weak var editNameField: UITextField!
    
    @IBOutlet weak var editGameField: UITextField!
    
    @IBOutlet weak var editStarsField: UITextField!
    
    var index:Int?
    
    var modelArray:[Player]!
    
    var editedModel:Player?
    
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
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var myRating = 1
        if let rating = Int(editStarsField.text!) {
            myRating = rating
        }
        
        if segue.identifier == "save" {
            editedModel = Player(name: editNameField.text, game: editGameField.text, rating: myRating)
        }
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    
    
}
