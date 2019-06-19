//
// Created by Jan Kase on 2018-11-01.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import CoreLocation
import Foundation

public class JKSharedLocationManagerDelegate: NSObject, JKLocationManagerDelegate {
  public static var shared: JKSharedLocationManagerDelegate = .init()

  public var subDelegates: [CLLocationManagerDelegate] = .init()
  public var defaultLocationManager: () -> JKLocationManager = { .shared }

  override init() {
    super.init()
    defaultLocationManager().delegate = self
  }

  public func register(subDelegate aSubDelegate: CLLocationManagerDelegate) {
    if _indexOf(subElement: aSubDelegate) == nil { // each delegate only one time
      subDelegates.append(aSubDelegate)
    }
  }

  public func remove(subDelegate aSubDelegate: CLLocationManagerDelegate) {
    guard let theIndex = _indexOf(subElement: aSubDelegate) else {
      return
    }
    subDelegates.remove(at: theIndex)
  }

  public func locationManagerDidStartUpdatingLocation(_ aManager: JKLocationManager) {
    _jkSubDelegates.forEach { $0.locationManagerDidStartUpdatingLocation?(aManager) }
  }

  public func locationManagerDidStopUpdatingLocation(_ aManager: JKLocationManager) {
    _jkSubDelegates.forEach { $0.locationManagerDidStopUpdatingLocation?(aManager) }
  }

  public func locationManagerDidStartMonitoringSignificantLocationChanges(_ aManager: JKLocationManager) {
    _jkSubDelegates.forEach { $0.locationManagerDidStartMonitoringSignificantLocationChanges?(aManager) }
  }

  public func locationManagerDidStopMonitoringSignificantLocationChanges(_ aManager: JKLocationManager) {
    _jkSubDelegates.forEach { $0.locationManagerDidStopMonitoringSignificantLocationChanges?(aManager) }
  }

  public func locationManager(_ aManager: CLLocationManager, didUpdateLocations aLocations: [CLLocation]) {
    subDelegates.forEach { $0.locationManager?(aManager, didUpdateLocations: aLocations) }
  }

  public func locationManager(_ aManager: CLLocationManager, didUpdateHeading aHeading: CLHeading) {
    subDelegates.forEach { $0.locationManager?(aManager, didUpdateHeading: aHeading) }
  }

  public func locationManagerShouldDisplayHeadingCalibration(_ aManager: CLLocationManager) -> Bool {
    return subDelegates.reduce(false) { $0 || ($1.locationManagerShouldDisplayHeadingCalibration?(aManager) ?? false) }
  }

  public func locationManager(_ aManager: CLLocationManager,
                              didDetermineState aState: CLRegionState,
                              for aRegion: CLRegion) {
    subDelegates.forEach { $0.locationManager?(aManager, didDetermineState: aState, for: aRegion) }
  }

  public func locationManager(_ aManager: CLLocationManager,
                              didRangeBeacons aBeacons: [CLBeacon],
                              in aRegion: CLBeaconRegion) {
    subDelegates.forEach { $0.locationManager?(aManager, didRangeBeacons: aBeacons, in: aRegion) }
  }

  public func locationManager(_ aManager: CLLocationManager,
                              rangingBeaconsDidFailFor aRegion: CLBeaconRegion,
                              withError anError: Error) {
    subDelegates.forEach { $0.locationManager?(aManager, rangingBeaconsDidFailFor: aRegion, withError: anError) }
  }

  public func locationManager(_ aManager: CLLocationManager, didEnterRegion aRegion: CLRegion) {
    subDelegates.forEach { $0.locationManager?(aManager, didEnterRegion: aRegion) }
  }

  public func locationManager(_ aManager: CLLocationManager, didExitRegion aRegion: CLRegion) {
    subDelegates.forEach { $0.locationManager?(aManager, didExitRegion: aRegion) }
  }

  public func locationManager(_ aManager: CLLocationManager, didFailWithError anError: Error) {
    subDelegates.forEach { $0.locationManager?(aManager, didFailWithError: anError) }
  }

  public func locationManager(_ aManager: CLLocationManager,
                              monitoringDidFailFor aRegion: CLRegion?,
                              withError anError: Error) {
    subDelegates.forEach { $0.locationManager?(aManager, monitoringDidFailFor: aRegion, withError: anError) }
  }

  public func locationManager(_ aManager: CLLocationManager, didChangeAuthorization aStatus: CLAuthorizationStatus) {
    subDelegates.forEach { $0.locationManager?(aManager, didChangeAuthorization: aStatus) }
  }

  public func locationManager(_ aManager: CLLocationManager, didStartMonitoringFor aRegion: CLRegion) {
    subDelegates.forEach { $0.locationManager?(aManager, didStartMonitoringFor: aRegion) }
  }

  public func locationManagerDidPauseLocationUpdates(_ aManager: CLLocationManager) {
    subDelegates.forEach { $0.locationManagerDidPauseLocationUpdates?(aManager) }
  }

  public func locationManagerDidResumeLocationUpdates(_ aManager: CLLocationManager) {
    subDelegates.forEach { $0.locationManagerDidResumeLocationUpdates?(aManager) }
  }

  public func locationManager(_ aManager: CLLocationManager, didFinishDeferredUpdatesWithError anError: Error?) {
    subDelegates.forEach { $0.locationManager?(aManager, didFinishDeferredUpdatesWithError: anError) }
  }

  public func locationManager(_ aManager: CLLocationManager, didVisit aVisit: CLVisit) {
    subDelegates.forEach { $0.locationManager?(aManager, didVisit: aVisit) }
  }

  private var _jkSubDelegates: [JKLocationManagerDelegate] {
    return subDelegates.compactMap { $0 as? JKLocationManagerDelegate }
  }

  private func _indexOf(subElement aSubElement: CLLocationManagerDelegate) -> Int? {
    return subDelegates.firstIndex { $0 === aSubElement }
  }
}
