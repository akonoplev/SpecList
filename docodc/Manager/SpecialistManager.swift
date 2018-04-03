//
//  SpecialistManager.swift
//  docodc
//
//  Created by Андрей Коноплев on 04.04.2018.
//  Copyright © 2018 Андрей Коноплев. All rights reserved.
//

import Foundation
import SwiftyJSON

class SpecialistManager {
    class func getSpeciality(success:@escaping (_ models: [SpecialityModel])-> Void, failure: (_ error: String)-> Void ) {
        _ = API_wrapper.getSpecialists(success: { (response) in
            let json = JSON(response)
            let specList = json["SpecList"].arrayValue
            var specArray = [SpecialityModel]()
            print(specList)
            for speciality in specList {
                let nameGenitive = speciality["NameGenitive"].stringValue
                let branchAlias = speciality["BranchAlias"].stringValue
                let name = speciality["Name"].stringValue
                let alias = speciality["Alias"].stringValue
                let namePluralGentive = speciality["NamePluralGenitive"].stringValue
                let nameOlurak = speciality["NamePlural"].stringValue
                let isSimple = speciality["IsSimple"].boolValue
                let branchName = speciality["BranchName"].stringValue
                let id = speciality["id"].intValue
                
                let model = SpecialityModel(nameGenitive: nameGenitive, branchAlias: branchAlias, name: name, alias: alias, namePluralGentive: namePluralGentive, namePlural: nameOlurak, isSimple: isSimple, branchName: branchName, id: id)
                specArray.append(model)
            }
            
            success(specArray)
            
        }, failure: { (error) in
            print(error)
        })
    }
}
