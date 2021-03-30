//
//  Constants.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 11/03/2021.
//

import Foundation
import UIKit
import SwiftUI

struct K {
    struct Colors {
        static let startColor = UIColor(red: 0.93,
                                        green: 0.27,
                                        blue: 0.21,
                                        alpha: 1.00)
        static let endColor = UIColor(red: 0.97,
                                      green: 0.58,
                                      blue: 0.12,
                                      alpha: 1.00)
        static let gray15 = UIColor(red: 0.15,
                                       green: 0.15,
                                       blue: 0.15,
                                       alpha: 1.00)
        static let lightGrayColor = UIColor(red: 0.5,
                                            green: 0.5,
                                            blue: 0.5,
                                            alpha: 1.00)
        static let gray17 = UIColor(red: 0.17,
                                       green: 0.17,
                                       blue: 0.17,
                                       alpha: 1.00)
        static let gray19 = UIColor(red: 0.19,
                                       green: 0.19,
                                       blue: 0.19,
                                       alpha: 1.00)
        static let gray27 = UIColor(red: 0.27,
                                       green: 0.27,
                                       blue: 0.27,
                                       alpha: 1.00)
        static let gray72 = UIColor(red: 0.72,
                                       green: 0.72,
                                       blue: 0.72,
                                       alpha: 1.00)
        
        static let defaultGradient = LinearGradient(gradient: Gradient(colors: [Color(K.Colors.startColor), Color(K.Colors.endColor)]), startPoint: .leading, endPoint: .trailing)
    }
    struct Strings {
        static let mapboxURL = "mapbox://styles/mapbox/streets-v11"
    }
    
    static let daysOfTheWeek = [dayOfTheWeek(name: "Domingo", shortName: "Dom."),
                                dayOfTheWeek(name: "Lunes", shortName: "Lun."),
                                dayOfTheWeek(name: "Martes", shortName: "Mar."),
                                dayOfTheWeek(name: "Miércoles", shortName: "Mié."),
                                dayOfTheWeek(name: "Jueves", shortName: "Jue."),
                                dayOfTheWeek(name: "Viernes", shortName: "Vie."),
                                dayOfTheWeek(name: "Sábado", shortName: "Sáb.")]
}
