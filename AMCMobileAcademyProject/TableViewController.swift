//
//  TableViewController.swift
//  AMCMobileAcademyProject
//
//  Created by Андрей on 12/03/2020.
//  Copyright © 2020 AMC. All rights reserved.
//

import UIKit

struct CellDataModel {
    let title: String
    let body: String
}

class TableViewController: UITableViewController {
    
    var dataArray: [CellDataModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

    }
    
    //внесение данных в массив
    func loadData() {
        let item1 = CellDataModel(title: "Sasha", body: "25")
        let item2 = CellDataModel(title: "Katya", body: "22")
        let item3 = CellDataModel(title: "Petya", body: "37")
        
        dataArray.append(item1)
        dataArray.append(item2)
        dataArray.append(item3)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //количество секций в таблице
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //количество ячеек в секции
        return dataArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //регистрация ячейки по типу CustomTableViewCell с идентификатором "customCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        //indexPath состоит из номера секции и номера ячейки. К номеру ячейки обращение идет через .row
        //вносим текст из массива в лейблы ячейки
        cell.titleLable.text = dataArray[indexPath.row].title
        cell.bodyLabel.text = dataArray[indexPath.row].body

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
