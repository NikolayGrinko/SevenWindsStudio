//
//  Model.swift
//  SevenWindsStudio
//
//  Created by Николай Гринько on 05.02.2024.
//

import Foundation

// MARK: - WelcomeElement
struct WelcomeElement: Codable {
	let id: Int
	let name: String
	let imageURL: String
	let price: Int
	let point: Point
}

// MARK: - Point
struct Point: Codable {
	let latitude: String
	let longitude: String
}

typealias Welcome = [WelcomeElement]
