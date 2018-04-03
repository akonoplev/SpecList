//
//  ViewController.swift
//  docodc
//
//  Created by Андрей Коноплев on 03.04.2018.
//  Copyright © 2018 Андрей Коноплев. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSource = [SpecialityModel]()
    var specialGroupedByFirstLetterInSName = [String.Element: [SpecialityModel]]()
    var arrayOfFirstLetters = [String.Element]()
    var sortedDict = [(key: String.Element, value: [SpecialityModel])]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Специальности"
        sendRequest()
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        
        specialGroupedByFirstLetterInSName = Dictionary(grouping: dataSource) {
            $0.name.first!}
        arrayOfFirstLetters = Array(specialGroupedByFirstLetterInSName.keys.sorted())
        sortedDict = specialGroupedByFirstLetterInSName.sorted{$0.key < $1.key}
        
        return arrayOfFirstLetters.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return String(Array(specialGroupedByFirstLetterInSName.keys.sorted())[section])
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return sortedDict[section].value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "specCell", for: indexPath)
        cell.textLabel?.text = sortedDict[indexPath.section].value[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController {
    func sendRequest() {
        SpecialistManager.getSpeciality(success: { (dataSource) in
            DispatchQueue.main.async {
                self.dataSource = dataSource
                self.tableView.reloadData()
            }
        }) { (error) in
            print(error)
        }
    }
}

