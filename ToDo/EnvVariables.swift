//
//  EnvVariables.swift
//  ToDo
//
//  Created by 汤子晏 on 2024/10/6.
//

import SwiftUI


//Used to store temporary json file
struct TempJsonKey: EnvironmentKey {
    static let defaultValue = ""
}

extension EnvironmentValues {
    var tempJson: String {
        get { self[TempJsonKey.self] }
        set { self[TempJsonKey.self] = newValue }
    }
}
