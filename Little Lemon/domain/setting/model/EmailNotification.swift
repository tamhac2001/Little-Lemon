//
//  EmailNotification.swift
//  Little Lemon
//
//  Created by Tam Hac on 05/03/2024.
//

import Foundation

enum EmailNotification: String, CaseIterable, Codable {
    case orderStatus = "Order statuses"
    case passwordChange = "Password changes"
    case specialOffer = "Special offers"
    case newsletter = "Newsletter"
}
