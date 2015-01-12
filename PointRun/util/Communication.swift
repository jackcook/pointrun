//
//  Communication.swift
//  PointRun
//
//  Created by Jack Cook on 9/24/14.
//  Copyright (c) 2014 CosmicByte. All rights reserved.
//

import Foundation

class Message: NSObject {
    
    var latitude = 0.0
    var longitude = 0.0
    var points = 0
    
    var uuid = ""
    var type: PRMessageType!
    
    init(playerDataWithPoints pts: Int, latitude lat: Double, longitude lon: Double) {
        latitude = lat
        longitude = lon
        points = pts
        type = .PlayerData
    }
    
    init(pointLocationWithLatitude lat: Double, longitude lon: Double, points pts: Int, uuid uid: String) {
        latitude = lat
        longitude = lon
        points = pts
        uuid = uid
        type = .PointLocation
    }
    
    init(pointCapturedWithUUID uid: String) {
        uuid = uid
        type = .PointCaptured
    }
    
    required init(coder aDecoder: NSCoder) {
        latitude = aDecoder.decodeDoubleForKey("latitude")
        longitude = aDecoder.decodeDoubleForKey("longitude")
        points = aDecoder.decodeIntegerForKey("points")
        uuid = aDecoder.decodeObjectForKey("uuid") as String
        
        let typeValue = aDecoder.decodeIntegerForKey("type")
        
        switch typeValue {
        case 0:
            type = .PlayerData
        case 1:
            type = .PointLocation
        case 2:
            type = .PointCaptured
        default:
            break
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeDouble(latitude, forKey: "latitude")
        aCoder.encodeDouble(longitude, forKey: "longitude")
        aCoder.encodeInteger(points, forKey: "points")
        aCoder.encodeObject(uuid, forKey: "uuid")
        aCoder.encodeInteger(type.rawValue, forKey: "type")
    }
    
    func intToMessageType(int: Int) -> PRMessageType {
        switch int {
        case 0:
            return .PlayerData
        case 1:
            return .PointLocation
        case 2:
            return .PointCaptured
        default:
            break
        }
        
        return .PlayerData
    }
}