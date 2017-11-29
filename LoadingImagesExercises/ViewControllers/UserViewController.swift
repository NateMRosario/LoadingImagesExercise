//
//  ViewController.swift
//  LoadingImagesExercises
//
//  Created by C4Q on 11/28/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var users = [User]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadUsers()
    }

    func loadUsers() {
        let url = "https://randomuser.me/api/?nat=us&results=50"
        let completion: ([User]) -> Void = {(onlineUser: [User]) in
            self.users = onlineUser
        }
        let errorHandler: (AppError) -> Void = {(error: AppError) in
            switch error {
            case .couldNotParseJSON(let error):
                print("JSONError: \(error)")
            case .noInternetConnection:
                print("No internet connection")
            default:
                print("Error")
            }
        }
        UserAPIClient.manager.getUsers(from: url, completiongHandler: completion, errorHandler: errorHandler)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destionation = segue.destination as? UserDetailViewController {
            destionation.user = users[tableView.indexPathForSelectedRow!.row]
        }
    }

}
extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        let user = users[indexPath.row]
        cell.nameLabel.text = "\(user.name.first.capitalized) \(user.name.last.capitalized)"
        cell.ageLabel.text = "Age: \(2017 - Int(user.dob.prefix(4))!)"
        cell.cellLabel.text = "Cell: \(user.cell)"
        cell.userImageView.image = nil
        guard let imageURLStr = user.picture?.large else {
            return cell
        }
        let completion: (UIImage) -> Void = {(onlineImage: UIImage) in
            cell.imageView?.image = onlineImage
            cell.setNeedsLayout()
        }
        ImageAPIClient.manager.getImage(from: imageURLStr,
                                        completionHandler: completion,
                                        errorHandler: {print($0)})
        return cell
    }
}
