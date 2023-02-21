//
//  ColorState.swift
//  ReSwiftTestingApp
//
//  Created by Andrii Bezkorovainyi on 2/21/23.
//

import ReSwift

enum ColorScheme: String {
    case yellow = "yellow"
    case green = "green"
    case blue = "blue"
    case red = "red"
    case gray = "gray"
    
    var colors: AppColors {
        AppColors(
            background: UIColor(named: "\(self.rawValue)background") ?? UIColor.systemBackground,
            caption: UIColor(named: "\(self.rawValue)caption") ?? UIColor.label,
            border: UIColor(named: "\(self.rawValue)border") ?? UIColor.systemBackground,
            buttonBackground: UIColor(named: "\(self.rawValue)buttonBackground") ?? UIColor.secondarySystemBackground,
            pieceLidht: UIColor(named: "\(self.rawValue)pieceLidht") ?? UIColor.white,
            pieceDark: UIColor(named: "\(self.rawValue)pieceDark") ?? UIColor.black,
            boardBackground: UIColor(named: "\(self.rawValue)boardBackground") ?? UIColor.gray)
    }
}

struct AppColors {
    var background: UIColor
    var caption: UIColor
    var border: UIColor
    var buttonBackground: UIColor
    var pieceLidht: UIColor
    var pieceDark: UIColor
    var boardBackground: UIColor
}

struct ColorState {
    var colorScheme: ColorScheme
    init(colorScheme: ColorScheme = .gray) {
        self.colorScheme = colorScheme
    }
}


