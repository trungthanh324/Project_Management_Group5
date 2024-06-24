//
//  HomeCollectionVC.swift
//  ProjectManagement
//
//  Created by 1 0 1 1  on 29/5/24.
//

import UIKit

class HomeCollectionVC: UICollectionViewCell {

    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var imgCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupcell()
    }
    func setupcell(){
        viewCell.layer.borderWidth = 1
        viewCell.layer.masksToBounds = true
    }
}
