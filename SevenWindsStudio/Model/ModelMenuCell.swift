//
//  ModelMenuCell.swift
//  SevenWindsStudio
//
//  Created by Николай Гринько on 09.02.2024.
//

import Foundation
import UIKit

struct MenuCollection {
	
	static func setupMenu() -> [MenuCustom] {
		[
			.init(id: 1, imageName: "1", titleName: "Эспрессо", titleCount: "200 руб"),
			.init(id: 2, imageName: "2", titleName: "Капучино", titleCount: "250 руб"),
			.init(id: 3, imageName: "3", titleName: "Латте", titleCount: "260 руб"),
			.init(id: 4, imageName: "4", titleName: "Шоколад", titleCount: "150 руб"),
			.init(id: 5, imageName: "5", titleName: "Гляссе", titleCount: "220 руб"),
			.init(id: 6, imageName: "6", titleName: "Капучино лайт", titleCount: "280 руб"),
			.init(id: 7, imageName: "7", titleName: "Мокачино", titleCount: "120 руб"),
			.init(id: 8, imageName: "8", titleName: "Американо", titleCount: "100 руб"),
		]
	}
}

struct MenuCustom {
	let id: Int
	let imageName: String
	let titleName: String
	let titleCount: String
}
