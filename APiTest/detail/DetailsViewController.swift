//
//  DetailsViewController.swift
//  APiTest
//
//  Created by Noban on 16/6/1441 AH.
//  Copyright © 1441 Noban. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var data: [Data] = []
    var imageUrl : String?
    var indexpath : Int = 0
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: data[indexpath].avatar!)
         image.kf.setImage(with: url)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
