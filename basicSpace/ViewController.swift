//
//  ViewController.swift
//  basicSpace
//
//  Created by Takhti, Gholamreza on 10/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCellIdentifier")
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        self.view.backgroundColor = .red
    }
    
    private func setupViews() {
        self.view.addSubview(collectionView)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        
    }


}

extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCellIdentifier", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let noOfCellsInRow = 3

         let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

         let totalSpace = flowLayout.sectionInset.left
             + flowLayout.sectionInset.right
             + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

         let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

         return CGSize(width: size, height: size)
    }
    
    
}

