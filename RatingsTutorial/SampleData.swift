//
//  SampleData.swift
//  RatingsTutorial
//
//  Created by fahri on 01.06.18.
//  Copyright © 2018 fahri. All rights reserved.
//

import Foundation

final class SampleData {
    
    static func generatePlayersData() -> [Player] {
        
        return [
            Player(name: "Karim Benzema", game: "Soccer", rating: 5),
            Player(name: "Kevin Durant", game: "Basketball", rating: 3),
            Player(name: "Van Damme", game: "Bloodsport", rating: 1)
        ]
    }
}
