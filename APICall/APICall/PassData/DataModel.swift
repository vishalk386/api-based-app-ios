//
//  DataModel.swift
//  APICall
//
//  Created by Akash Dandge on 01/07/21.
//

import Foundation
protocol DataModelDelegate: AnyObject {
    func didReceiveDataUpdata(data: String)
    
}

class  DataModel{
    
    weak var delagate: DataModelDelegate?
    func getData(){
    let data = "This is Vishal Kamble"
        delagate?.didReceiveDataUpdata(data: data)
    }
}
