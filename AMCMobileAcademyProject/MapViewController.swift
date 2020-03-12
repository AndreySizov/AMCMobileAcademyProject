//
//  MapViewController.swift
//  AMCMobileAcademyProject
//
//  Created by Андрей on 12/03/2020.
//  Copyright © 2020 AMC. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //преобразование текстового адреса в координату
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString("Новинский бульвар, 21", completionHandler: {placemarks, error in
            //проверка возможной ошибки
            if let err = error{
                print(err)
                return
            }
            
            //проверка, что адрес расшифровался
            if let address = placemarks?[0]{
            //подпись к точке на карте
            let annotation = MKPointAnnotation()
            annotation.coordinate = (address.location?.coordinate)!
            annotation.title = "Американский центр"
            annotation.subtitle = "Новинский бульвар, 21"
            self.mapView.showAnnotations([annotation], animated: true)
            self.mapView.selectAnnotation(annotation, animated: true)
            }
            
        })
        
    }
}
