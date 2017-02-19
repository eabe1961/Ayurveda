
//  DoshaModel.swift

import Foundation

let questions = [
    "Ik voer mijn activiteiten/werkzaamheden snel uit",
    "Ik leer snel en vergeet gemakkelijk",
    "Ik ben enthousiast en levendig",
    "Ik heb een dun uiterlijk en kom niet gemakkelijk aan",
    /*
    "Ik ben licht en bewegelijk",
    "Ik ben besluiteloos",
    "Ik raak gemakkelijk opgeblazen en verstopt",
    "Ik heb koude handen en voeten",
    "Ik pieker vaak en ben bezorgd en verontrust",
    "Ik houd niet van koud weer, eten en drinken",
    "Ik spreek snel en mijn vrienden noemen mij een kletskous",
    "Ik ben humeurig en emotioneel",
    "Ik val moeilijk in slaap of slaap licht",
    "Ik heb een droge huid",
    "Ik heb een actieve verbeelding en mijn gedachten zijn rusteloos",
    "Ik ervaar wisselende energie",
    "Ik raak gemakkelijk geergerd en geprikkeld",
    "Ik ben efficiënt",
    "Ik ben precies en ordelijk",
    "Ik heb een goed geproportioneerd, gemiddeld gebouwd lichaam",
    "Ik heb een sterke en krachtige wil en word niet snel beïnvloed door anderen",
    "Ik word snel moe en voel mij oncomfortabel bij warm weer",
    "Ik transpireer gemakkelijk",
    "Ik ben ongeduldig, snel boos en kan dat goed verbergen",
    "Ik kan geen maaltijd overslaan",
    "Ik heb een goed eetlust en kan, als ik wil, grote hoeveelheden verorberen",
    "Ik ben besluitvaardig, koppig en kan kritisch zijn",
    "Ik raak zelden verstopt",
    "Ik ben een perfectionist",
    "Ik heb een voorkeur voor koude temperaturen",
    "Ik houd van koel eten en drinken",
    "Ik pas voor overmatig pittig voedsel",
    "Ik heb moeite met mensen die het niet met mij eens zijn",
    "Ik houd van goede uitdagingen en richt mijn aandacht op het behalen van mijn doelen",
    "Ik start langzaam en bedachtzaam op",
    "Ik kom snel aan en val langzaam af",
    "Ik ben geduldig en evenwichtig",
    "Ik ervaar het niet als lastig om een maaltijd over te slaan",
    "Ik raak gemakkelijk verstopt en ervaar problemen met mijn holten",
    "Ik slaap erg diep",
    "Ik geef de voorkeur aan 8 of meer uren slaap",
    "Ik leer langzaam, maar heb een uitstekend lange termijn geheugen",
    "Ik word niet gemakkelijk ziek",
    "Ik houd niet van vochtigheid en nevelig weer",
    "Ik heb een soepele, zachte huid",
    "Ik heb een grote, solide lichaamsbouw",
    "Ik heb een langzame stofwisseling",
    "Ik heb veel energie, ben een doorzetter en houd lang vol",
    "Ik ben liefdevol, hartelijk, zorgzaam en innemend",
    "Ik eet langzaam",
    "Ik denk, ervaar de wereld en werk systematisch",
    */
    ]


class Answers {
    var created: Date // Date/time when the quiz was taken.
    var prakruti : [Int] // Answers for childhood.
    var vikruti: [Int] // Answer for past month.

    // Totals.
    var vataprakruti: Int = 0
    var vatavikruti: Int = 0
    var pittaprakruti: Int = 0
    var pittavikruti: Int = 0
    var kaphaprakruti: Int = 0
    var kaphavikruti: Int = 0

    init() {
        created = Date()
        prakruti = Array(repeating: 0, count: 51)
        vikruti = Array(repeating: 0, count: 51)
        }

    func calculateTotals() {
        vataprakruti = prakruti[0...16].reduce(0, +)
        pittaprakruti = prakruti[17...33].reduce(0, +)
        kaphaprakruti = prakruti[34...50].reduce(0, +)
        vatavikruti = vikruti[0...16].reduce(0, +)
        pittavikruti = vikruti[17...33].reduce(0, +)
        kaphavikruti = vikruti[34...50].reduce(0, +)
        }

    }
