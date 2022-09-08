//
//  Activity.swift
//  Integrador-iOS
//
//  Created by Santiago Barragan Leon on 8/09/22.
//

import Foundation

struct Activity: Codable {
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
    let accessibility: Double
}

