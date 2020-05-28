//
//  DummyData.swift
//  KangSayur
//
//  Created by Bimo Sekti Wicaksono on 28/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import Foundation

class DummyData {
    func ListPedagang() -> [Pedagang] {
        var arrayPedagang: [Pedagang] = []
        arrayPedagang.append(Pedagang(name: "Bu Sumringah", address: "Jl Sana-Sini blok A nomor 8, Kampoeng Utan", phone: "080989898989", isSubscribe: true))
        arrayPedagang.append(Pedagang(name: "Pak Jojon", address: "Jl MuluJadianKaga blok C nomor 5, Kampoeng Buntu", phone: "150400", isSubscribe: true))
        arrayPedagang.append(Pedagang(name: "Mas Siul", address: "Jl JokesBapakBapak blok B nomor 3, Kampoeng Uwu", phone: "08123123123", isSubscribe: true))
        arrayPedagang.append(Pedagang(name: "Mbak Iyem", address: "Jl SemakBelukar blok M nomor 7, Kampoeng Iyaiyabae", phone: "0987654321", isSubscribe: false))
        arrayPedagang.append(Pedagang(name: "Bu Brewok", address: "Jl MuluJadianKaga blok C nomor 5, Kampoeng Buntu", phone: "150400", isSubscribe: false))
        return arrayPedagang
    }
    
    func ListSubscribe() -> [Pedagang] {
        var arrayPedagang: [Pedagang] = []
        arrayPedagang.append(Pedagang(name: "Bu Sumringah", address: "Jl Sana-Sini blok A nomor 8, Kampoeng Utan", phone: "080989898989", isSubscribe: true))
        arrayPedagang.append(Pedagang(name: "Pak Jojon", address: "Jl MuluJadianKaga blok C nomor 5, Kampoeng Buntu", phone: "150400", isSubscribe: true))
        arrayPedagang.append(Pedagang(name: "Mas Siul", address: "Jl JokesBapakBapak blok B nomor 3, Kampoeng Uwu", phone: "08123123123", isSubscribe: true))
        return arrayPedagang
    }
}

class DataSubscribe {
    var data: [Pedagang] = []
}
