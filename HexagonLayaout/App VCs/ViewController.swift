//
//  ViewController.swift
//  HexagonLayaout
//
//  Created by BS126 on 12/3/18.
//  Copyright © 2018 BS23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categorylist: [Category] = [
        Category(categoryTitle: "Fashion And wearables", categoryImageName: "Fashion"),
        Category(categoryTitle: "Outdoor", categoryImageName: "Outdoor"),
        Category(categoryTitle: "Interior and furniture", categoryImageName: "InteriorAndFurniture"),
        Category(categoryTitle: "Child and baby", categoryImageName: "ChildAndBaby"),
        Category(categoryTitle: "Art and Design", categoryImageName: "ArtAndDesign"),
        Category(categoryTitle: "Devices and audio", categoryImageName: "DevicesAndAudio"),
        Category(categoryTitle: "leisure and hobbies", categoryImageName: "LeisureAndHobbies")]
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

//MARK: UICollectionViewDatasource and Delgate methods
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HexagonCell", for: indexPath) as! HexagonCollectionViewCell
        cell.hexagonBackgroundView.frame = cell.bounds
        let hexagonView = HexagonView(frame: cell.hexagonBackgroundView.layer.frame)
        let backgroundImage = UIImageView(frame: hexagonView.layer.bounds)
        backgroundImage.image = UIImage(named: categorylist[indexPath.item % categorylist.count].categoryImageName!)
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        hexagonView.insertSubview(backgroundImage, at: 0)
        cell.hexagonBackgroundView.mask = hexagonView
        cell.hexagonView = hexagonView
        cell.hexagonBackgroundView?.addSubview(hexagonView)
        cell.delegate = self
        cell.hexagonView.addTarget(cell, action: #selector(cell.clikedOnCell(_:)), for: .touchUpInside)
        return cell
    }
}

//MARK: clickedOncategoryDelegate Methods
extension ViewController : ClickedOncategoryDelegate {
    func clickedOncategory(cell: HexagonCollectionViewCell) {
        guard let indexpath = categoryCollectionView.indexPath(for: cell) else {
            return
        }
        print(indexpath.item)
    }
}


