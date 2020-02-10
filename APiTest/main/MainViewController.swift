//
//  MainViewController.swift
//  APiTest
//
//  Created by Noban on 15/6/1441 AH.
//  Copyright © 1441 Noban. All rights reserved.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var rpPhotos: RPPhotos?
    var data : [Data] = []
    var indexpathS : Int = 0
    var image : String?
    override func viewDidLoad() {
        super.viewDidLoad()
          getPhotos()
        // Do any additional setup after loading the view.
    }
    

 
//     MARK: - Navigation
//
//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if(segue.identifier == "IDshow"){   if let indexPath = collectionView.indexPathsForSelectedItems{
               let displayVC = segue.destination as! DetailsViewController
               
                displayVC.data = data
            
            
                        
       
}
    

}
    }
}
extension MainViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        
        let url = URL(string: data[indexPath.row].avatar!)
      
        cell.iv_image.kf.setImage(with: url)
       
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexpathS = indexPath.row
        self.performSegue(withIdentifier: "IDshow", sender: collectionView.self)
          
          
    }
    
    
    
    
}
extension MainViewController{
    
    func getPhotos(){
        APIService.getPhotos { (rpPhotos, responseStatus) in
            if(responseStatus.isSuccess){
                print(rpPhotos?.total)
                self.data = rpPhotos!.data
                self.collectionView.reloadData()
            }
            else{
                
            }
        }
    }
}

