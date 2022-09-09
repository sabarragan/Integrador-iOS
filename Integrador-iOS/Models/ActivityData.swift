//
//  TaskData.swift
//  Integrador-iOS
//
//  Created by Jacobo Ezequiel Corvalan on 08/09/2022.
//

import Foundation

struct ActivityData: Codable {
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
    let accessibility: Double
}
