//
//  APODTableViewCell.swift
//  NewAgeSysTest
//
//  Created by WC-64 on 10/11/22.
//  Copyright © 2022 Farhan. All rights reserved.
//

import UIKit

protocol CellConfigurable {
    
    associatedtype CellData
    
    func configureCell(with info:CellData)
    
}

class APODTableViewCell: UITableViewCell, CellConfigurable {
   
    typealias CellData = APOD
    
    
    @IBOutlet weak var ivProfile : BaseImageView!
    @IBOutlet weak var lblProfileName : UILabel!
    @IBOutlet weak var lblDate : UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with info: APOD) {
        self.lblProfileName.text = info.title
        self.ivProfile.setImage(image: info.url)
        let date = MyDateFormatter.convertDateFromatted(inDate: info.date ?? "", inFormat: .yyyyMMdd, outFormat: .MMMddyyy)
        self.lblDate.text = "Date : \(date)"
    }
    

}
