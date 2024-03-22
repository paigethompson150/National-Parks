//
//  ParksResponse.swift
//  national-parks
//
//  Created by Paige Thompson on 3/22/24.
//

import Foundation

struct ParksResponse: Codable {
    let data: [Park]
}

struct Park: Codable, Identifiable {
    let id: String
    let fullName: String
    let description: String
    let latitude: String
    let longitude: String
    let images: [ParkImage]
    let name: String
}

struct ParkImage: Codable {
    let title: String
    let caption: String
    let url: String
}
