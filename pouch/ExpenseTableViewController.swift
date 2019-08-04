//
//  ExpenseTableViewController.swift
//  pouch
//
//  Created by Damien Hervieux on 2019/07/30.
//  Copyright © 2019 Damien Hervieux. All rights reserved.
//

import UIKit

class ExpenseTableViewController: UITableViewController {
    
//    var expenses = [Expense]()
    var expenses = Array(repeating: [Expense](), count: 2)
    var sections = ["Fixed Expenses", "Dynamic Expenses"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleExpenses()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //MARK: Private Methods
    
    private func loadSampleExpenses() {
        Api.shared.get{(res) in
            switch res {
            case .failure(let err):
                print(err)
            case .success(let expenses):
                self.expenses[0] = expenses
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
           
        };
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses[section].count
    }
    
    // Create a standard header that includes the returned text.
    override func tableView(_ tableView: UITableView, titleForHeaderInSection
        section: Int) -> String? {
        return "\(sections[section])"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ExpenseTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ExpenseTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")}
        
        let expense = expenses[indexPath.section][indexPath.row]
        
        cell.expenseName.text = expense.name
        cell.expenseNumber.text = String(expense.amount)

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
