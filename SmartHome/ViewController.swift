//
//  ViewController.swift
//  SmartHome
//
//  Created by Mac on 31/01/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topCollection: UICollectionView!
    @IBOutlet weak var bottomCollection: UICollectionView!
    
    @IBOutlet var viewController: UIView!
    
    let massTopCollection: [String] = ["Умный дом", "Детская", "Коридор", "Кухня", "Спальня"]
    
    var enumNamesPoints: [EnumNames] = [.lighting, .habitat, .socket, .sensor]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topCollection.dataSource = self
        topCollection.delegate = self
        bottomCollection.dataSource = self
        bottomCollection.delegate = self
        
        gradient()
        
        registerCell()
    }
    
    func gradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .axial
        gradientLayer.frame = self.viewController.bounds
        gradientLayer.colors = [UIColorFromHex(rgbValue: 0x1D392C, alpha: 1), UIColor.black.cgColor]
        gradientLayer.locations = [0, 0.25]
        self.viewController.layer.insertSublayer(gradientLayer, at: 0)
        self.topCollection.backgroundColor = UIColor(named: "")
    }
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0

        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    func registerCell() {
        let nib = UINib(nibName: TopCollectionViewCell.id, bundle: nil)
        topCollection.register(nib, forCellWithReuseIdentifier: TopCollectionViewCell.id)
        
        let nib2 = UINib(nibName: BottomCollectionViewCell.id, bundle: nil)
        bottomCollection.register(nib2, forCellWithReuseIdentifier: BottomCollectionViewCell.id)
    }
    

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topCollection {
            return massTopCollection.count
        } else {
            return enumNamesPoints.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        
        if collectionView == topCollection {
          
            let cell = topCollection.dequeueReusableCell(withReuseIdentifier: TopCollectionViewCell.id, for: indexPath)
            guard let nameCell = cell as? TopCollectionViewCell else { return cell }
            nameCell.setName(massTopCollection: massTopCollection[indexPath.row])
            
            return nameCell
        } else {
            let type = enumNamesPoints[indexPath.row]
            
            let cell = bottomCollection.dequeueReusableCell(withReuseIdentifier: BottomCollectionViewCell.id, for: indexPath)
            guard let nameCell = cell as? BottomCollectionViewCell else { return cell }
            nameCell.setupData(type: type)
            return nameCell
            
            
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            guard let screen = view.window?.windowScene?.screen else { return .zero }
            let width = (screen.bounds.width - 20)  / 2
        return CGSize(width: width, height: width / 1.5)
        
        
    }
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == bottomCollection {
            let type = enumNamesPoints[indexPath.row]
            let story = UIStoryboard(name: "Main", bundle: nil)
            switch type {
                case .lighting:
                    let lightingVC = story.instantiateViewController(withIdentifier: "LightController") as! LightController
                    push(vc: lightingVC)
                case .habitat:
                    let habitatVC = story.instantiateViewController(withIdentifier: "HabitatController") as! HabitatController
                    push(vc: habitatVC)
                case .socket:
                    let socketVC = story.instantiateViewController(withIdentifier: "SocketController") as! SocketController
                    push(vc: socketVC)
                case .sensor:
                    let sensorVC = story.instantiateViewController(withIdentifier: "SensorController") as! SensorController
                    push(vc: sensorVC)
                default:
                     UIViewController()
            }
        }
    }
}

extension ViewController: NavigationDelegate {
    
    func push(vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
