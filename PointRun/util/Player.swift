//
//  Player.swift
//  PointRun
//
//  Created by Jack Cook on 9/24/14.
//  Copyright (c) 2014 CosmicByte. All rights reserved.
//

import Foundation

class Player: NSObject {
    
    var playerNum = 0
    var points = 0
    
    var pid: String!
    var name: String!
    var mapPoint: GMSMarker!
    var image = UIImageView()
    var pointsLabel = UILabel()
}