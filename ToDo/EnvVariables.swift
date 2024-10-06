//
//  EnvVariables.swift
//  ToDo
//
//  Created by 汤子晏 on 2024/10/6.
//

import SwiftUI
struct ViewNameKey: EnvironmentKey {
    static let defaultValue = "Home"
}

// 扩展EnvironmentValues来使用我们的环境变量键
extension EnvironmentValues {
    var viewName: String {
        get { self[ViewNameKey.self] }
        set { self[ViewNameKey.self] = newValue }
    }
}