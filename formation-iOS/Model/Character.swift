//
//  Character.swift
//  formation-iOS
//
//  Created by julien.pechon on 11/03/2022.
//

import Foundation

struct Character: Codable {
    var id: Int = 0
    var name: String = ""
    var mass: Double? = 0
    var height: Double? = 0
    var species: String? = ""
    var eyeColor: String? = ""
    var image: String = ""
}
