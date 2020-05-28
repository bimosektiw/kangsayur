//
//  test.swift
//  KangSayur
//
//  Created by Hubert Daryanto on 27/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import Foundation
import UIKit

var itemordered = [Product]()
var pedagangselected = Pedagang(name: "0", address: "0", phone: "0")

class Testttt{
    public func getItemOrdered() -> [Product]
    {
        return itemordered
    }
    public func setItemOrdered(data: [Product])
    {
        itemordered = data
    }
    public func getPedagangSelected() -> Pedagang
    {
        return pedagangselected
    }
    public func setPedagangSelected(data: Pedagang)
    {
        pedagangselected = data
    }
}
