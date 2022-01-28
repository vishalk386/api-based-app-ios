//
//  DataTableViewCell.swift
//  APICall
//
//  Created by Akash Dandge on 01/07/21.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UILabel!
    var titleLbl:String = ""
    var bodyLbl:String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        self.title.text =  titleLbl
        self.body.text = bodyLbl
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
