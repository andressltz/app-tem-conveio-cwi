//
//  MapTableViewCell.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 05/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    func config(with address: String?) {
        DispatchQueue.main.async {
            if let address = address {
                self.addressLabel.text = address
                let geocoder = CLGeocoder()
                geocoder.geocodeAddressString(address) { [weak self] placemarks, error in
                    if let placemark = placemarks?.first, let location = placemark.location {
                        let mark = MKPlacemark(placemark: placemark)
                        if var region = self?.mapView.region {
                            region.center = location.coordinate
                            region.span.longitudeDelta /= 8.0
                            region.span.latitudeDelta /= 8.0
                            self?.mapView.setRegion(region, animated: true)
                            self?.mapView.addAnnotation(mark)
                        }
                    }
                }
            } else {
                self.addressLabel.text = "-"
            }
        }
    }

}
