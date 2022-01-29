//
//  DateFormatter.swift
//  Wallet
//
//  Created by Sergei Tarasenko on 29.01.2022.
//

import Foundation

func dateToString(_: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMMM"
    let string = dateFormatter.string(from: Date())
    return string
}
