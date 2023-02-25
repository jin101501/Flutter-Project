import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled26/data/my_location.dart';
import 'package:untitled26/data/network.dart';
import 'package:untitled26/screens/weather_screen.dart';
const apikey='ca7e05f96c4e9c25f4aee71f41ec0923';

class Loading extends StatefulWidget{
  @override
  _LoadingState createState()=>_LoadingState();
}


class _LoadingState extends State<Loading> {
  late double latitude3;
  late double longitude3;
  @override
  void initState() {
    super.initState();
    getLocation();

  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network('https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric');

    var weatherData = await network.getJsonData();
    print(weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return WeatherScreen(parseWeatherData: weatherData,);
    }));
  }

 //void fetchData() async{

  //   var myJson = parsingData['weather'][0]['description'];
  //   print(myJson);
  //   var wind = parsingData['wind']['speed'];
  //   print(wind);

  //   var id =  parsingData['id'];
   //  print(id);
  // }else{
  //   print('There was a problem with the internet connection.');
  // }
//}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocation();
          },
          child: Text(
            'Get my location',
            style: TextStyle(
                color: Colors.white
            ),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }
}