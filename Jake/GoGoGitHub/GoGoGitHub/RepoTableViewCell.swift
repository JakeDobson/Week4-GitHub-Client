//
//  RepoTableViewCell.swift
//  GoGoGitHub
//
//  Created by Jacob Dobson on 11/1/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    //outlets
    @IBOutlet weak var textLabelOne: UILabel!
    @IBOutlet weak var textLabelTwo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
