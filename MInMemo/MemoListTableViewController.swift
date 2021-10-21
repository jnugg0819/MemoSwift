//
//  MemoListTableViewController.swift
//  MInMemo
//
//  Created by Kuzan on 2021/10/14.
//

import UIKit

class MemoListTableViewController: UITableViewController {
    
    let formatter:DateFormatter = {
       let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .none
        f.locale = Locale(identifier: "Ko_kr")
        return f
    }()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let cell = sender as? UITableViewCell , let indexPath = tableView.indexPath(for: cell){
            let target = Memo.dummyMemoList[indexPath.row]
            
            if let vc = segue.destination as? DetailViewController{
                vc.memo = target
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("it's viewDiload")
    }
    


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        print("it's viewWillAppear")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("it's viewDidAppear")
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Memo.dummyMemoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let target = Memo.dummyMemoList[indexPath.row]
        cell.textLabel?.text = target.content
        cell.detailTextLabel?.text = formatter.string(from: target.insertDate)

        // Configure the cell...

        return cell
    }

}
