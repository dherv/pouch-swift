//
//  Expense.swift
//  pouch
//
//  Created by Damien Hervieux on 2019/07/30.
//  Copyright © 2019 Damien Hervieux. All rights reserved.
//
import UIKit

class Schema: Decodable {
    var id: Int
    var name: String
    var amount: Int
    var monthly_day: Int
    var debut: String
    var end: String?
    var group: Int
    
    init?(id: Int, name:String, amount: Int, monthly_day: Int, group: Int, debut: String, end: String) {
        // Initialization should fail if
        if name.isEmpty || amount < 0 || group < 0 || monthly_day < 0 {
            return nil
        }
        // Initialize stored properties.
        self.id = id
        self.name = name
        self.amount = amount
        self.monthly_day = monthly_day
        self.debut = debut
        self.end = end
        self.group = group
    }

}

class Expense: Decodable {
    //MARK: Properties
    var id: Int
    var name: String
    var amount: Int
    var debit_date: String
    var group: Int
    
    var schema: Schema
    
    //MARK: Initialization
    init?(id: Int, name:String, amount: Int, debit_date: String, group: Int, schema: Schema) {
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || amount < 0 || group < 0  {
            return nil
        }
        // Initialize stored properties.
        self.id = id
        self.name = name
        self.amount = amount
        self.debit_date = debit_date
        self.group = group
        self.schema = schema
    }
}
