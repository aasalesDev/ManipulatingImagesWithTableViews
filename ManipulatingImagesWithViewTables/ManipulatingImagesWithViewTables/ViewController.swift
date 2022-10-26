//
//  ViewController.swift
//  ManipulatingImagesWithViewTables
//
//  Created by Anderson Sales on 26/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var countries: [Country] = [
        Country(name: "estonia", flag: UIImage(named: "estonia")),
        Country(name: "france", flag: UIImage(named: "france")),
        Country(name: "germany", flag: UIImage(named: "germany")),
        Country(name: "ireland", flag: UIImage(named: "ireland")),
        Country(name: "italy", flag: UIImage(named: "italy")),
        Country(name: "monaco", flag: UIImage(named: "monaco")),
        Country(name: "nigeria", flag: UIImage(named: "nigeria")),
        Country(name: "poland", flag: UIImage(named: "poland")),
        Country(name: "russia", flag: UIImage(named: "russia")),
        Country(name: "spain", flag: UIImage(named: "spain")),
        Country(name: "uk", flag: UIImage(named: "uk")),
        Country(name: "us", flag: UIImage(named: "us"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        title = "COUNTRIES"
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.image = countries[indexPath.row].flag
            vc.myTitle = countries[indexPath.row].name
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as? CustomTableViewCell {
            cell.setupCustomCell(name: countries[indexPath.row].name?.capitalized, image: UIImage(named: countries[indexPath.row].name ?? "Unknow Image"))
            return cell
        }
        return UITableViewCell()
    }
    
    
}
