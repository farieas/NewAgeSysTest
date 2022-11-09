//
//  APODDetailViewController.swift
//  NewAgeSysTest
//
//  Created by WC-64 on 10/11/22.
//  Copyright © 2022 Farhan. All rights reserved.
//

import UIKit

class APODDetailViewController: UIViewController {
    
    var apod : APOD?
    
    // MARK: - IBOUTLETS
    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblDate : UILabel!
    @IBOutlet weak var lblDescription : UILabel!
    @IBOutlet weak var ivImage : UIImageView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setUI() {
        self.title = "APOD DETAILS"
        self.lblName.text = apod?.title
        self.lblDate.text = apod?.date
        self.lblDescription.text = apod?.explanation
        self.ivImage.setImage(image: apod?.url)
        self.navigationItem.largeTitleDisplayMode = .never
    }

}
