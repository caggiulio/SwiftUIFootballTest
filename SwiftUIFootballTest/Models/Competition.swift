//
//	Competition.swift
//
//	Create by nunzio giulio caggegi on 24/6/2019
//	Copyright © 2019 nunzio giulio caggegi. All rights reserved.
//	Model file Generated using: 
//	Vin.Favara's JSONExportV https://github.com/vivi7/JSONExport 
//	(forked from Ahmed-Ali's JSONExport)
//

import Foundation
import SwiftyJSON

class Competition{

	var area : Area!
	var code : String!
	var currentSeason : CurrentSeason!
	var emblemUrl : String!
	var id : Int!
	var lastUpdated : String!
	var name : String!
	var numberOfAvailableSeasons : Int!
	var plan : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json == nil{
			return
		}
		let areaJson = json["area"]
		if areaJson != JSON.null {
			area = Area(fromJson: areaJson)
		}
		code = json["code"].stringValue
		let currentSeasonJson = json["currentSeason"]
		if currentSeasonJson != JSON.null{
			currentSeason = CurrentSeason(fromJson: currentSeasonJson)
		}
		emblemUrl = json["emblemUrl"].stringValue
		id = json["id"].intValue
		lastUpdated = json["lastUpdated"].stringValue
		name = json["name"].stringValue
		numberOfAvailableSeasons = json["numberOfAvailableSeasons"].intValue
		plan = json["plan"].stringValue
	}

}
