import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:geocoding/geocoding.dart';

class GmapHomePage extends StatefulWidget {
  const GmapHomePage({Key? key}) : super(key: key);

  @override
  State<GmapHomePage> createState() => _GmapHomePageState();
}

class _GmapHomePageState extends State<GmapHomePage> {

  double lat = 0.0;
  double long = 0.0;
  String address = ""; // to store address

  String locationMessage = 'Current location of the user';

  /// get current location
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied,we cannot request permission');
    }

    return await Geolocator.getCurrentPosition();
  }

  /// listen to location updates
  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
    .listen((Position position) {
      lat = position.latitude;
      long = position.longitude;

      setState(() {
        locationMessage = 'Latitude = $lat , Longitude = $long';
      });
    });
  }


  Future<void> _openMap(double lat, double long) async {
    String googleURL = 'https://maps.google.com/maps/search/?api=1&query=$lat,$long';
    await canLaunchUrlString(googleURL)
    ?  await launchUrlString(googleURL)
        : throw 'Could not launch $googleURL';

  }

  Future<void> _getPlace() async {
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, long );

    // this is all you need
    Placemark placeMark  = newPlace[0];
    String? name = placeMark.name;
    String? subLocality = placeMark.subLocality;
    String? locality = placeMark.locality;
    String? administrativeArea = placeMark.administrativeArea;
    String? postalCode = placeMark.postalCode;
    String? country = placeMark.country;
    String? address = "${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";

    print(address);

    setState(() {
      address = address; // update _address
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("User location"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                locationMessage,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    getCurrentLocation().then((value) {
                      lat = value.latitude;
                      long = value.longitude;
                      setState(() {
                        locationMessage = 'Latitude = $lat , Longitude = $long';
                      });
                      _liveLocation();
                    });
                  }, child: const Text('Get current location')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: (){
                _openMap(lat,long);
              },
                  child: const Text('Open google map')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: (){
                _getPlace();
              },
                  child: const Text('get address'))

            ],
          ),
        ));
  }

}
