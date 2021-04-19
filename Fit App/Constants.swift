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
        static let gray68 = UIColor(red: 0.68,
                                    green: 0.68,
                                    blue: 0.68,
                                    alpha: 1.00)
        static let gray72 = UIColor(red: 0.72,
                                       green: 0.72,
                                       blue: 0.72,
                                       alpha: 1.00)
        
        static let defaultGradient = LinearGradient(gradient: Gradient(colors: [Color(K.Colors.startColor), Color(K.Colors.endColor)]), startPoint: .leading, endPoint: .trailing)
    }
    struct Strings {
        static let mapboxURL = "mapbox://styles/mapbox/streets-v11"
        struct Frecuency {
            static let frecuency0 = "Hago ejercicio de 0-1 veces a la semana."
            static let frecuency1 = "Hago ejercicio de 2-3 veces a la semana."
            static let frecuency2 = "Hago ejercicio de 3-4 veces a la semana."
            static let frecuency3 = "Hago ejercicio de 5-7 veces a la semana."
        }
    }
    
    static let daysOfTheWeek = [DayOfTheWeek(name: "Domingo", shortName: "Dom",
                                    dayNumber: 1),
                                DayOfTheWeek(name: "Lunes", shortName: "Lun", dayNumber: 2),
                                DayOfTheWeek(name: "Martes", shortName: "Mar", dayNumber: 3),
                                DayOfTheWeek(name: "Miércoles", shortName: "Mié", dayNumber: 4),
                                DayOfTheWeek(name: "Jueves", shortName: "Jue", dayNumber: 5),
                                DayOfTheWeek(name: "Viernes", shortName: "Vie", dayNumber: 6),
                                DayOfTheWeek(name: "Sábado", shortName: "Sáb", dayNumber: 7)]
}
