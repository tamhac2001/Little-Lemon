//
//  Item.swift
//  Little Lemon
//
//  Created by Tam Hac on 26/02/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
