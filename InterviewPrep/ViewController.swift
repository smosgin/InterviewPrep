//
//  ViewController.swift
//  InterviewPrep
//
//  Created by Seth Mosgin on 12/6/18.
//  Copyright © 2018 Seth Mosgin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var inputTextField: UITextField?
    @IBOutlet var tableView: UITableView?
    
    var networkService: NetworkService?
    var xenoItems: [Xeno] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView?.rowHeight = 100
        tableView?.dataSource = self
        tableView?.delegate = self
        searchForBird(searchTerm: "Oriole")
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let searchText = inputTextField?.text {
            searchForBird(searchTerm: searchText)
        }
    }
    
    func searchForBird(searchTerm: String) {
        guard let networkService = networkService else { return }
        
        networkService.retrieveContents(searchTerm: searchTerm) { results, err in
            if !err.isEmpty {
                print("ERROR " + err)
                // TODO: pop an alert with the error
            } else {
                self.xenoItems = results
                self.updateUI()
            }
        }
    }
    
    func updateUI() {
        DispatchQueue.main.async {
//            self.xenoItems = input
            self.tableView?.reloadData()
        }
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return xenoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = xenoItems[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "XenoCell", for: indexPath) as? XenoTableViewCell {
            cell.englishTextLabel?.text = item.englishName
            cell.genericTextLabel?.text = item.genericName
            cell.specificTextLabel?.text = item.specificName
            
            return cell
        } else {
            fatalError("XenoCell is not able to be dequeued properly")
        }
    }

}

