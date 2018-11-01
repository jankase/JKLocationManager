//
// Created by Jan Kase on 2018-11-01.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import CoreLocation
import Foundation

@objc
public protocol JKLocationManagerDelegate: CLLocationManagerDelegate {

  @objc
  optional func locationManagerDidStartUpdatingLocation(_ aManager: JKLocationManager)
  @objc
  optional func locationManagerDidStopUpdatingLocation(_ aManager: JKLocationManager)
  @objc
  optional func locationManagerDidStartMonitoringSignificantLocationChanges(_ aManager: JKLocationManager)
  @objc
  optional func locationManagerDidStopMonitoringSignificantLocationChanges(_ aManager: JKLocationManager)

}
