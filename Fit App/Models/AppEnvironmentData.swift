//
//  AppEnvironmentData.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 18/03/2021.
//

import Foundation
import UIKit
import SwiftUI

class AppEnviromentData: ObservableObject {
    //@Published var currentPage: Navigation? = .GenderSelection
    @Published var userGender: Bool? = false
    @Published var userWeight: Int? = 0
    @Published var usedWeightUnit: Bool? = true //KG
    @Published var usedHeightUnit: Bool? = true //CM
    @Published var userHeight: Int? = 0
    @Published var userAge: Int? = 18
    @Published var userMotivation: Int? = 0
    @Published var userFrecuency: Int? = 0
}
