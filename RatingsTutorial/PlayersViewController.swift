//
//  PlayersViewController.swift
//  RatingsTutorial
//
//  Created by fahri on 01.06.18.
//  Copyright © 2018 fahri. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {
    
    var players: [Player] = SampleData.generatePlayersData()
}

extension PlayersViewController {
    
    @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue) {
        
        guard let playersDetailsViewController = segue.source as? PlayerDetailsViewController,
            let player = playersDetailsViewController.player else {
                return
        }
        
        players.append(player)
        
        let indexPath = IndexPath(row: players.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    @IBAction func saveToMainViewController (segue:UIStoryboardSegue) {
        
        let detailViewController = segue.source as! DetailTableViewController
        
        let index = detailViewController.index
        
        let modelString = detailViewController.editedModel
        
        players[index!].name = modelString!
        
        tableView.reloadData()
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell",
                                                 for: indexPath) as! PlayerCell
        
        let player = players[indexPath.row]
        cell.player = player
        return cell
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "edit" {
            
            var path = tableView.indexPathForSelectedRow
            
            var detailViewController = segue.destination as! DetailTableViewController
            
            detailViewController.index = path?.row
            detailViewController.modelArray = players
            
        }
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
}
