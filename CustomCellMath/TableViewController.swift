//
//  TableViewController.swift
//  CustomCellMath
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // an array of arrays
    // i.e. [[1, 2, 3, 4], [5, 3, 1, 0], [5, 2, 6, 6]]
    var numbers: [[Int]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()



        generateData()
        
    }
    func tableView(_ tableView: UITableView, numberOfSectionsIn section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return numbers.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mathCell", for: indexPath) as! MathTableViewCell
        let selectedNumbers = numbers[indexPath.row]
        print(selectedNumbers)
        cell.firstNumberLabel?.text = "\(selectedNumbers[0])"
        cell.secondNumberLabel?.text = "\(selectedNumbers[1])"
        cell.thirdNumberLabel?.text = "\(selectedNumbers[2])"
        cell.fourthNumberLabel?.text = "\(selectedNumbers[3])"        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "mathHandoff" {return}
        if let dest = segue.destination as? DisplayMathViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            print(indexPath.row)
            dest.numbers = numbers[indexPath.row]
        }
        
    }
    
    
    


}



// MARK: - Generating an array of Data
extension TableViewController {
    
    func generateData() {
        for _ in 1...100 {
            var newNumberRow: [Int] = []
            
            for _ in 1...4 {
                let randomNumber = randomNumberFromOneTo(50)
                newNumberRow.append(randomNumber)
            }
            
            numbers.append(newNumberRow)
        }
    }
    
    func randomNumberFromOneTo(_ number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)) + 1)
    }
    
    
}
