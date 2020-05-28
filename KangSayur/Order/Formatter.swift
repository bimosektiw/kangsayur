//
//  Formatter.swift
//  KangSayur
//
//  Created by Hubert Daryanto on 27/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import Foundation

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}
