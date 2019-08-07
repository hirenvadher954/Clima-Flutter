import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = "c848c7ef6312ed88d1786bea2e5a409b";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude, longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(url: 
        "https://samples.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");
    
    var weatherData = await networkHelper.getData();
     
  }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
          
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
