//
//  API_wrapper.swift
//  docodc
//
//  Created by Андрей Коноплев on 03.04.2018.
//  Copyright © 2018 Андрей Коноплев. All rights reserved.
//

import Foundation


class API_wrapper {
    //MARK: get Dialogs
    class func getSpecialists( success: @escaping (_ json: Any)->Void, failure: @escaping (_ errorDescription: String)-> Void)-> URLSessionTask {
        let url = "https://api.docdoc.ru/public/rest/1.0.9/speciality"
        
        
        let request = API_conf.getRequst(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, requestError) in
            API_conf.acceptDataFromServer(data: data, RequestError: requestError, success: success, failure: failure)
        }
        
        dataTask.resume()
        return dataTask
    }
    
    class func getDoctor( success: @escaping (_ json: Any)->Void, failure: @escaping (_ errorDescription: String)-> Void)-> URLSessionTask {
        let url = "https://api.docdoc.ru/public/rest/1.0.9/speciality"
        
        
        let request = API_conf.getRequst(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, requestError) in
            API_conf.acceptDataFromServer(data: data, RequestError: requestError, success: success, failure: failure)
        }
        
        dataTask.resume()
        return dataTask
    }
    

}
