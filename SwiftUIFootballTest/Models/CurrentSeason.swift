//
//	CurrentSeason.swift
//
//	Create by nunzio giulio caggegi on 24/6/2019
//	Copyright © 2019 nunzio giulio caggegi. All rights reserved.
//	Model file Generated using: 
//	Vin.Favara's JSONExportV https://github.com/vivi7/JSONExport 
//	(forked from Ahmed-Ali's JSONExport)
//

import Foundation
import SwiftyJSON

class CurrentSeason{

	var currentMatchday : Int!
	var endDate : String!
	var id : Int!
	var startDate : String!
	var winner : Winner!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json == nil{
			return
		}
		currentMatchday = json["currentMatchday"].intValue
		endDate = json["endDate"].stringValue
		id = json["id"].intValue
		startDate = json["startDate"].stringValue
		let winnerJson = json["winner"]
		if winnerJson != JSON.null{
			winner = Winner(fromJson: winnerJson)
		}
	}

}