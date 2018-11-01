//
// Created by Jan Kase on 2018-11-01.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import CoreLocation
import Foundation

public class JKLocationManager: CLLocationManager {

  public static var shared: JKLocationManager = JKLocationManager()

  public override func startUpdatingLocation() {
    super.startUpdatingLocation()
    (delegate as? JKLocationManagerDelegate)?.locationManagerDidStartUpdatingLocation?(self)
  }

  public override func stopUpdatingLocation() {
    super.stopUpdatingLocation()
    (delegate as? JKLocationManagerDelegate)?.locationManagerDidStopUpdatingLocation?(self)
  }

  public override func startMonitoringSignificantLocationChanges() {
    super.startMonitoringSignificantLocationChanges()
    (delegate as? JKLocationManagerDelegate)?.locationManagerDidStartMonitoringSignificantLocationChanges?(self)
  }

  public override func stopMonitoringSignificantLocationChanges() {
    super.stopMonitoringSignificantLocationChanges()
    (delegate as? JKLocationManagerDelegate)?.locationManagerDidStopMonitoringSignificantLocationChanges?(self)
  }

}
