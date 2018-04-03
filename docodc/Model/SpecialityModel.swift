//
//  File.swift
//  docodc
//
//  Created by Андрей Коноплев on 04.04.2018.
//  Copyright © 2018 Андрей Коноплев. All rights reserved.
//

import Foundation

class SpecialityModel {
    let nameGenitive: String
    let branchAlias: String
    let name: String
    let alias: String
    let namePluralGentive: String
    let namePlural: String
    let isSimple: Bool
    let branchName: String
    let id: Int
    
    init(nameGenitive: String, branchAlias: String, name: String, alias: String, namePluralGentive: String, namePlural: String, isSimple: Bool, branchName: String, id: Int ) {
        self.nameGenitive = nameGenitive
        self.branchAlias = branchAlias
        self.name = name
        self.alias = alias
        self.namePluralGentive = namePluralGentive
        self.namePlural = namePlural
        self.isSimple = isSimple
        self.branchName = branchName
        self.id =  id
    }
    
    
}
