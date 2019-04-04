//
//  Emoji.swift
//  Intermediate Table Views
//
//  Created by Давид on 04/04/2019.
//  Copyright © 2019 Давид. All rights reserved.
//

struct Emoji {
    let emoji: String
    let name: String
    let desc: String
    
    static func load() -> [Emoji] {
        let emojis = [
            Emoji(emoji: "🙂", name: "Smile", desc: "Смайлик"),
            Emoji(emoji: "☺️", name: "Red smile", desc: "Смущенная улыбка"),
            Emoji(emoji: "😹", name: "Crying cat", desc: "Плачущий кот"),
            Emoji(emoji: "🤡", name: "An eye", desc: "Глаз"),
            Emoji(emoji: "👮‍♂️", name: "Policeman", desc: "Плицейский"),
            Emoji(emoji: "🤶", name: "Sant Clause", desc: "Дед мороз"),
            Emoji(emoji: "👸", name: "Princess", desc: "Принцесса")
        ]
        
        return emojis
    }
}
