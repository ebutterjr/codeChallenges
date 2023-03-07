//
//  UserTableViewCell.swift
//  Api code challenge
//
//  Created by Easton Butterfield on 3/7/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var registerLabel: UILabel!
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with user: User) {
        nameLabel.text = "\(user.name.title) \(user.name.first) \(user.name.last)"
        emailLabel.text = user.email
        registerLabel.text = user.registered?.date
        // Set the user's image
        if let url = URL(string: user.picture.large) {
          URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
              self?.userImageView.image = UIImage(data: data)
            }
          }.resume()
        }
        // Set the user's address
        if let city = user.location?.city {
          locationLabel.text = "\(city)"
        }
        if let login = user.login?.username {
          loginLabel.text = "\(login)"
        }
      }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
