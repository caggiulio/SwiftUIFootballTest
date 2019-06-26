//
//	CompetitionsRoot.swift
//
//	Create by nunzio giulio caggegi on 24/6/2019
//	Copyright © 2019 nunzio giulio caggegi. All rights reserved.
//	Model file Generated using: 
//	Vin.Favara's JSONExportV https://github.com/vivi7/JSONExport 
//	(forked from Ahmed-Ali's JSONExport)
//

import Foundation
import SwiftyJSON

class CompetitionsRoot{

	var competitions : [Competition]!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json == nil{
			return
		}
		competitions = [Competition]()
		let competitionsArray = json["competitions"].arrayValue
		for competitionsJson in competitionsArray{
			let value = Competition(fromJson: competitionsJson)
			competitions.append(value)
		}
	}

}