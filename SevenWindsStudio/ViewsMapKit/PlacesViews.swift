//
//  PlacesViews.swift
//  SevenWindsStudio
//
//  Created by Николай Гринько on 08.02.2024.
//

import Foundation
import MapKit

/// class фото вместо маркера
class PlacesViews: MKAnnotationView {
	
	override var annotation: MKAnnotation? {
		willSet {
			guard let places = newValue as? Places else {
				return
			}
			//показывает выноски
			canShowCallout = true
			// размещение выноски
			calloutOffset = CGPoint(x: -5, y: 5)
			// показывает значение нашей правой кнопки
			rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
			image = places.image
		}
	}
}
