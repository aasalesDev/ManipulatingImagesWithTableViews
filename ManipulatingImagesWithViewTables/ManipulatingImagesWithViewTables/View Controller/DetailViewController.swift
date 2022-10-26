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
        configureView()
    }
    
    func configureView(){
        flagImageView.image = image
        title = myTitle?.uppercased()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped(){
        guard let image = flagImageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
