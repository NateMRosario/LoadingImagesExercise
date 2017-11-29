//
//  UserDetailViewController.swift
//  LoadingImagesExercises
//
//  Created by C4Q on 11/28/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "\(user.name.first.capitalized) \(user.name.last.capitalized)"
        ageLabel.text = "Age: \(2017 - Int(user.dob.prefix(4))!)"
        cellLabel.text = "Cell: \(user.cell)"
        phoneLabel.text = "Phone: \(user.phone)"
        locationLabel.text = "Address: \(user.location.street.capitalized)"
        addressLabel.text = "\(user.location.city.capitalized), \(user.location.state.capitalized). \(user.location.postcode)"
        loadImage()
    }
    func loadImage() {
        guard let imageURLStr = user.picture?.large else {
            return
        }
        let completion: (UIImage) -> Void = {(onlineImage: UIImage) in
            self.imageView.image = onlineImage
            self.imageView.setNeedsLayout()
        }
        ImageAPIClient.manager.getImage(from: imageURLStr, completionHandler: completion, errorHandler: {print($0)})
    }


}
