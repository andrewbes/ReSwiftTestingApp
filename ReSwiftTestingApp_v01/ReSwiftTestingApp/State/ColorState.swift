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
            background: UIColor(named: "\(self.rawValue)Background") ?? UIColor.systemBackground,
            caption: UIColor(named: "\(self.rawValue)Caption") ?? UIColor.label,
            border: UIColor(named: "\(self.rawValue)Border") ?? UIColor.systemBackground,
            buttonBackground: UIColor(named: "\(self.rawValue)ButtonBackground") ?? UIColor.secondarySystemBackground,
            pieceLidht: UIColor(named: "\(self.rawValue)PieceLidht") ?? UIColor.white,
            pieceDark: UIColor(named: "\(self.rawValue)PieceDark") ?? UIColor.black,
            boardBackground: UIColor(named: "\(self.rawValue)BoardBackground") ?? UIColor.gray)
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


