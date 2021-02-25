//
//  ListVC.swift
//  DarkModeExample
//
//  Created by Md. Kamrul Hasan on 25/2/21.
//

import UIKit

class ListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    class func showVC(navController: UINavigationController?) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "ListVC") as! ListVC
        navController?.pushViewController(vc, animated: true)
    }

    @IBAction func dismissTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension ListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Title for row \(indexPath.row)"
        return cell
    }
}
