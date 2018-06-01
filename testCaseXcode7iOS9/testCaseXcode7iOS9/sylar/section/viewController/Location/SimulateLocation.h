//
//  SimulateLocation.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/6/1.
//  Copyright © 2018年 sylar. All rights reserved.
//

// reference link: https://blog.scottlogic.com/2014/03/19/simulator-enhancements.html

#import <Foundation/Foundation.h>

@interface SimulateLocation : NSObject

@end

/*
 2018-06-01 16:37:30.102727+0800 testCaseXcode7iOS9[19657:1072482] out count = 129
 2018-06-01 16:37:30.102887+0800 testCaseXcode7iOS9[19657:1072482] mm: startUpdatingLocation
 2018-06-01 16:37:30.102992+0800 testCaseXcode7iOS9[19657:1072482] mm: stopUpdatingLocation
 2018-06-01 16:37:30.103086+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEvent:supportInfo:
 2018-06-01 16:37:30.103181+0800 testCaseXcode7iOS9[19657:1072482] mm: distanceFilter
 2018-06-01 16:37:30.103431+0800 testCaseXcode7iOS9[19657:1072482] mm: setDistanceFilter:
 2018-06-01 16:37:30.103534+0800 testCaseXcode7iOS9[19657:1072482] mm: desiredAccuracy
 2018-06-01 16:37:30.103633+0800 testCaseXcode7iOS9[19657:1072482] mm: setDesiredAccuracy:
 2018-06-01 16:37:30.103766+0800 testCaseXcode7iOS9[19657:1072482] mm: headingFilter
 2018-06-01 16:37:30.103867+0800 testCaseXcode7iOS9[19657:1072482] mm: setHeadingFilter:
 2018-06-01 16:37:30.103964+0800 testCaseXcode7iOS9[19657:1072482] mm: setPersistentMonitoringEnabled:
 2018-06-01 16:37:30.104199+0800 testCaseXcode7iOS9[19657:1072482] mm: allowsAlteredAccessoryLocations
 2018-06-01 16:37:30.104472+0800 testCaseXcode7iOS9[19657:1072482] mm: setAllowsAlteredAccessoryLocations:
 2018-06-01 16:37:30.104719+0800 testCaseXcode7iOS9[19657:1072482] mm: setDynamicAccuracyReductionEnabled:
 2018-06-01 16:37:30.104971+0800 testCaseXcode7iOS9[19657:1072482] mm: pausesLocationUpdatesAutomatically
 2018-06-01 16:37:30.105173+0800 testCaseXcode7iOS9[19657:1072482] mm: setPausesLocationUpdatesAutomatically:
 2018-06-01 16:37:30.105345+0800 testCaseXcode7iOS9[19657:1072482] mm: allowsBackgroundLocationUpdates
 2018-06-01 16:37:30.105736+0800 testCaseXcode7iOS9[19657:1072482] mm: setAllowsBackgroundLocationUpdates:
 2018-06-01 16:37:30.106027+0800 testCaseXcode7iOS9[19657:1072482] mm: showsBackgroundLocationIndicator
 2018-06-01 16:37:30.106271+0800 testCaseXcode7iOS9[19657:1072482] mm: setShowsBackgroundLocationIndicator:
 2018-06-01 16:37:30.106490+0800 testCaseXcode7iOS9[19657:1072482] mm: setMatchInfoEnabled:
 2018-06-01 16:37:30.106812+0800 testCaseXcode7iOS9[19657:1072482] mm: rangedRegions
 2018-06-01 16:37:30.107151+0800 testCaseXcode7iOS9[19657:1072482] mm: onDidBecomeActive:
 2018-06-01 16:37:30.107502+0800 testCaseXcode7iOS9[19657:1072482] mm: initWithEffectiveBundleIdentifier:bundle:
 2018-06-01 16:37:30.107743+0800 testCaseXcode7iOS9[19657:1072482] mm: locationServicesEnabled
 2018-06-01 16:37:30.108031+0800 testCaseXcode7iOS9[19657:1072482] mm: startMonitoringForRegion:
 2018-06-01 16:37:30.108279+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventAuthStatus:
 2018-06-01 16:37:30.108492+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventLocation:forceMapMatching:type:
 2018-06-01 16:37:30.108723+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventLocationUnavailable:
 2018-06-01 16:37:30.108960+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventHeading:
 2018-06-01 16:37:30.109174+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventHeadingCalibration:
 2018-06-01 16:37:30.109499+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventHistoricLocation:
 2018-06-01 16:37:30.109914+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventError:
 2018-06-01 16:37:30.110176+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventRegion:
 2018-06-01 16:37:30.110576+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventRegionState:
 2018-06-01 16:37:30.111176+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventRegionError:
 2018-06-01 16:37:30.112298+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventRanging:
 2018-06-01 16:37:30.112780+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventRangingError:
 2018-06-01 16:37:30.113072+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventPeerRanging:
 2018-06-01 16:37:30.113309+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventPeerRangingRequestProcessed:
 2018-06-01 16:37:30.113563+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventPeerRangingError:
 2018-06-01 16:37:30.113864+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventRegionResponseDelayed:
 2018-06-01 16:37:30.114139+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventRegionSetupCompleted:
 2018-06-01 16:37:30.114355+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventAutopauseStatus:
 2018-06-01 16:37:30.114554+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventBatch:
 2018-06-01 16:37:30.114817+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventInterrupted:
 2018-06-01 16:37:30.115018+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventVehicleSpeed:
 2018-06-01 16:37:30.115268+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventVehicleHeading:
 2018-06-01 16:37:30.115582+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventSignificantLocationVisit:
 2018-06-01 16:37:30.115788+0800 testCaseXcode7iOS9[19657:1072482] mm: onClientEventMicroLocations:
 2018-06-01 16:37:30.115992+0800 testCaseXcode7iOS9[19657:1072482] mm: resumeLocationUpdates
 2018-06-01 16:37:30.116277+0800 testCaseXcode7iOS9[19657:1072482] mm: pauseLocationUpdates:
 2018-06-01 16:37:30.116484+0800 testCaseXcode7iOS9[19657:1072482] mm: requestWhenInUseAuthorization
 2018-06-01 16:37:30.116731+0800 testCaseXcode7iOS9[19657:1072482] mm: locationServicesAvailable
 2018-06-01 16:37:30.116954+0800 testCaseXcode7iOS9[19657:1072482] mm: setSupportInfo:
 2018-06-01 16:37:30.117247+0800 testCaseXcode7iOS9[19657:1072482] mm: supportInfo
 2018-06-01 16:37:30.117432+0800 testCaseXcode7iOS9[19657:1072482] mm: internalClient
 2018-06-01 16:37:30.117636+0800 testCaseXcode7iOS9[19657:1072482] mm: setPrivateMode:
 2018-06-01 16:37:30.117857+0800 testCaseXcode7iOS9[19657:1072482] mm: privateMode
 2018-06-01 16:37:30.118078+0800 testCaseXcode7iOS9[19657:1072482] mm: markAsHavingReceivedLocation
 2018-06-01 16:37:30.118315+0800 testCaseXcode7iOS9[19657:1072482] mm: allowDeferredLocationUpdatesUntilTraveled:timeout:
 2018-06-01 16:37:30.118553+0800 testCaseXcode7iOS9[19657:1072482] mm: disallowDeferredLocationUpdates
 2018-06-01 16:37:30.118794+0800 testCaseXcode7iOS9[19657:1072482] mm: startAppStatusUpdates
 2018-06-01 16:37:30.119025+0800 testCaseXcode7iOS9[19657:1072482] mm: stopAppStatusUpdates
 2018-06-01 16:37:30.119258+0800 testCaseXcode7iOS9[19657:1072482] mm: startTechStatusUpdates
 2018-06-01 16:37:30.119506+0800 testCaseXcode7iOS9[19657:1072482] mm: stopTechStatusUpdates
 2018-06-01 16:37:30.119704+0800 testCaseXcode7iOS9[19657:1072482] mm: startMonitoringSignificantLocationChanges
 2018-06-01 16:37:30.119974+0800 testCaseXcode7iOS9[19657:1072482] mm: _startMonitoringSignificantLocationChangesOfDistance:withPowerBudget:
 2018-06-01 16:37:30.120225+0800 testCaseXcode7iOS9[19657:1072482] mm: stopMonitoringSignificantLocationChanges
 2018-06-01 16:37:30.120448+0800 testCaseXcode7iOS9[19657:1072482] mm: startMonitoringForRegion:desiredAccuracy:
 2018-06-01 16:37:30.120760+0800 testCaseXcode7iOS9[19657:1072482] mm: stopMonitoringForRegion:
 2018-06-01 16:37:30.121079+0800 testCaseXcode7iOS9[19657:1072482] mm: requestStateForRegion:
 2018-06-01 16:37:30.121279+0800 testCaseXcode7iOS9[19657:1072482] mm: maximumRegionMonitoringDistance
 2018-06-01 16:37:30.121494+0800 testCaseXcode7iOS9[19657:1072482] mm: monitoredRegions
 2018-06-01 16:37:30.121760+0800 testCaseXcode7iOS9[19657:1072482] mm: startRangingBeaconsInRegion:
 2018-06-01 16:37:30.122091+0800 testCaseXcode7iOS9[19657:1072482] mm: stopRangingBeaconsInRegion:
 2018-06-01 16:37:30.122316+0800 testCaseXcode7iOS9[19657:1072482] mm: requestRangingToPeers:timeoutSeconds:
 2018-06-01 16:37:30.122594+0800 testCaseXcode7iOS9[19657:1072482] mm: respondToRangingFromPeers:timeoutSeconds:
 2018-06-01 16:37:30.123062+0800 testCaseXcode7iOS9[19657:1072482] mm: startRangingToPeers:intervalSeconds:
 2018-06-01 16:37:30.123241+0800 testCaseXcode7iOS9[19657:1072482] mm: stopRangingToPeers:
 2018-06-01 16:37:30.123434+0800 testCaseXcode7iOS9[19657:1072482] mm: startRangingFromPeers:
 2018-06-01 16:37:30.123717+0800 testCaseXcode7iOS9[19657:1072482] mm: stopRangingFromPeers:
 2018-06-01 16:37:30.123951+0800 testCaseXcode7iOS9[19657:1072482] mm: resetApps
 2018-06-01 16:37:30.124203+0800 testCaseXcode7iOS9[19657:1072482] mm: appsUsingLocation
 2018-06-01 16:37:30.124436+0800 testCaseXcode7iOS9[19657:1072482] mm: appsUsingLocationWithDetails
 2018-06-01 16:37:30.124664+0800 testCaseXcode7iOS9[19657:1072482] mm: technologiesInUse
 2018-06-01 16:37:30.124904+0800 testCaseXcode7iOS9[19657:1072482] mm: onLocationRequestTimeout
 2018-06-01 16:37:30.125195+0800 testCaseXcode7iOS9[19657:1072482] mm: onRangingRequestTimeout
 2018-06-01 16:37:30.125420+0800 testCaseXcode7iOS9[19657:1072482] mm: requestAlwaysAuthorization
 2018-06-01 16:37:30.125764+0800 testCaseXcode7iOS9[19657:1072482] mm: isPersistentMonitoringEnabled
 2018-06-01 16:37:30.125999+0800 testCaseXcode7iOS9[19657:1072482] mm: isDynamicAccuracyReductionEnabled
 2018-06-01 16:37:30.126215+0800 testCaseXcode7iOS9[19657:1072482] mm: registerAsLocationClient
 2018-06-01 16:37:30.126423+0800 testCaseXcode7iOS9[19657:1072482] mm: setIsActuallyAWatchKitExtension:
 2018-06-01 16:37:30.126617+0800 testCaseXcode7iOS9[19657:1072482] mm: startMonitoringVisits
 2018-06-01 16:37:30.126883+0800 testCaseXcode7iOS9[19657:1072482] mm: stopMonitoringVisits
 2018-06-01 16:37:30.127123+0800 testCaseXcode7iOS9[19657:1072482] mm: _startLeechingVisits
 2018-06-01 16:37:30.127337+0800 testCaseXcode7iOS9[19657:1072482] mm: startUpdatingMicroLocationForLocationOfInterest:
 2018-06-01 16:37:30.127574+0800 testCaseXcode7iOS9[19657:1072482] mm: startUpdatingMicroLocation
 2018-06-01 16:37:30.127830+0800 testCaseXcode7iOS9[19657:1072482] mm: stopUpdatingMicroLocation
 2018-06-01 16:37:30.127977+0800 testCaseXcode7iOS9[19657:1072482] mm: requestCurrentMicroLocation
 2018-06-01 16:37:30.128183+0800 testCaseXcode7iOS9[19657:1072482] mm: delegate
 2018-06-01 16:37:30.128386+0800 testCaseXcode7iOS9[19657:1072482] mm: dealloc
 2018-06-01 16:37:30.128604+0800 testCaseXcode7iOS9[19657:1072482] mm: setDelegate:
 2018-06-01 16:37:30.128846+0800 testCaseXcode7iOS9[19657:1072482] mm: activityType
 2018-06-01 16:37:30.129100+0800 testCaseXcode7iOS9[19657:1072482] mm: init
 2018-06-01 16:37:30.129362+0800 testCaseXcode7iOS9[19657:1072482] mm: heading
 2018-06-01 16:37:30.129620+0800 testCaseXcode7iOS9[19657:1072482] mm: setPurpose:
 2018-06-01 16:37:30.129809+0800 testCaseXcode7iOS9[19657:1072482] mm: location
 2018-06-01 16:37:30.130074+0800 testCaseXcode7iOS9[19657:1072482] mm: headingAvailable
 2018-06-01 16:37:30.130327+0800 testCaseXcode7iOS9[19657:1072482] mm: dismissHeadingCalibrationDisplay
 2018-06-01 16:37:30.130598+0800 testCaseXcode7iOS9[19657:1072482] mm: setActivityType:
 2018-06-01 16:37:30.130783+0800 testCaseXcode7iOS9[19657:1072482] mm: startUpdatingLocationWithPrompt
 2018-06-01 16:37:30.131144+0800 testCaseXcode7iOS9[19657:1072482] mm: setHeadingOrientation:
 2018-06-01 16:37:30.131708+0800 testCaseXcode7iOS9[19657:1072482] mm: startUpdatingHeading
 2018-06-01 16:37:30.131907+0800 testCaseXcode7iOS9[19657:1072482] mm: stopUpdatingHeading
 2018-06-01 16:37:30.132149+0800 testCaseXcode7iOS9[19657:1072482] mm: startUpdatingVehicleSpeed
 2018-06-01 16:37:30.132419+0800 testCaseXcode7iOS9[19657:1072482] mm: stopUpdatingVehicleSpeed
 2018-06-01 16:37:30.132864+0800 testCaseXcode7iOS9[19657:1072482] mm: startUpdatingVehicleHeading
 2018-06-01 16:37:30.133055+0800 testCaseXcode7iOS9[19657:1072482] mm: stopUpdatingVehicleHeading
 2018-06-01 16:37:30.133287+0800 testCaseXcode7iOS9[19657:1072482] mm: requestWhenInUseAuthorizationWithPrompt
 2018-06-01 16:37:30.133550+0800 testCaseXcode7iOS9[19657:1072482] mm: isLocationServicesPreferencesDialogEnabled
 2018-06-01 16:37:30.133995+0800 testCaseXcode7iOS9[19657:1072482] mm: setLocationServicesPreferencesDialogEnabled:
 2018-06-01 16:37:30.134165+0800 testCaseXcode7iOS9[19657:1072482] mm: headingOrientation
 2018-06-01 16:37:30.134356+0800 testCaseXcode7iOS9[19657:1072482] mm: expectedGpsUpdateInterval
 2018-06-01 16:37:30.134729+0800 testCaseXcode7iOS9[19657:1072482] mm: requestLocation
 2018-06-01 16:37:30.134992+0800 testCaseXcode7iOS9[19657:1072482] mm: isMatchInfoEnabled
 2018-06-01 16:37:30.135223+0800 testCaseXcode7iOS9[19657:1072482] mm: initWithEffectiveBundleIdentifier:
 2018-06-01 16:37:30.135471+0800 testCaseXcode7iOS9[19657:1072482] mm: initWithEffectiveBundle:
 2018-06-01 16:37:30.135688+0800 testCaseXcode7iOS9[19657:1072482] mm: locationServicesApproved
 2018-06-01 16:37:30.135924+0800 testCaseXcode7iOS9[19657:1072482] mm: purpose
 
 */


