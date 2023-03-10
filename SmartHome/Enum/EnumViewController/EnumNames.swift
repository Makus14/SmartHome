//
//  EnumNames.swift
//  SmartHome
//
//  Created by Mac on 31/01/2023.
//

import Foundation
import UIKit

enum EnumNames: CaseIterable {
    case lighting
    case habitat
    case socket
    case sensor

    var title: String {
        switch self {
            case .lighting:         return "Освещение"
            case .habitat:          return "Среда"
            case .socket:           return "Розетки"
            case .sensor:           return "Датчики"
        
        }
    }
    
    var image: UIImage? {
        switch self {
            case .lighting:         return UIImage(named: "Lamp")
            case .habitat:          return UIImage(named: "habitat")
            case .socket:           return UIImage(named: "socket")
            case .sensor:           return UIImage(named: "sensor")
                
        }
    }
    
    var vc: UIViewController {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        switch self {
            case .lighting:
                let lightingVC = storybord.instantiateViewController(withIdentifier: "LightController")
                return lightingVC
            case .habitat:
                let habitatVC = storybord.instantiateViewController(withIdentifier: "HabitatController")
                return habitatVC
            case .socket:
                let socketVC = storybord.instantiateViewController(withIdentifier: "SocketController")
                return socketVC
            case .sensor:
                let sensorVC = storybord.instantiateViewController(withIdentifier: "SensorController")
                return sensorVC
            default:
                return UIViewController()
        }
    }
}

