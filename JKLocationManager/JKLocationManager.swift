//
// Created by Jan Kase on 2018-11-01.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import CoreLocation
import Foundation

public class JKLocationManager: CLLocationManager {
  public static var shared: JKLocationManager = .init()

  public override func startUpdatingLocation() {
    super.startUpdatingLocation()
    _jkLocationDelegate?.locationManagerDidStartUpdatingLocation?(self)
  }

  public override func stopUpdatingLocation() {
    super.stopUpdatingLocation()
    _jkLocationDelegate?.locationManagerDidStopUpdatingLocation?(self)
  }

  public override func startMonitoringSignificantLocationChanges() {
    super.startMonitoringSignificantLocationChanges()
    _jkLocationDelegate?.locationManagerDidStartMonitoringSignificantLocationChanges?(self)
  }

  public override func stopMonitoringSignificantLocationChanges() {
    super.stopMonitoringSignificantLocationChanges()
    _jkLocationDelegate?.locationManagerDidStopMonitoringSignificantLocationChanges?(self)
  }

  private var _jkLocationDelegate: JKLocationManagerDelegate? {
    return delegate as? JKLocationManagerDelegate
  }
}
