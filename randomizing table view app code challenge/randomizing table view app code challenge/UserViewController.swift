//
//  UserViewController.swift
//  randomizing table view app code challenge
//
//  Created by Easton Butterfield on 2/27/23.
//

import UIKit

class UserViewController: UIViewController {
    var users: [String] = []
    var newUser: String = ""
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var randomUserLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func enterUserButtonPressed(_ sender: Any) {
        guard userTextField.text?.isEmpty != true else {return}
        newUser = userTextField.text ?? ""
        userTextField.text = ""
        users.append(newUser)
    }
    
    
    @IBAction func getRandomUserButtonPressed(_ sender: Any) {
        let userCount = users.count - 1
        let randomNumber = Int.random(in: 0...userCount)
        let randomUser = users[randomNumber]
        randomUserLable.text = randomUser
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "viewUser", let vc = segue.destination as? RandomizerTableViewController else {return}
        vc.delegate = self
        vc.users = users
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
