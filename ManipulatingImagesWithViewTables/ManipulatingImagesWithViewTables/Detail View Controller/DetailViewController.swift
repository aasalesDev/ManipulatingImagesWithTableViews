//
//  DetailViewController.swift
//  ManipulatingImagesWithViewTables
//
//  Created by Anderson Sales on 26/10/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var flagImageView: UIImageView!
    
    var image: UIImage?
    var myTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flagImageView.image = image
        title = myTitle?.uppercased()
    }
}
