import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';


class Worker{

  Worker.worker({required this.location}){
    location = location;
  }

  late String location;
  late String temperature;
  late String humidity;
  late String airSpeed;
  late String description;
  late String main;
  late String feelsLike;
  late String minTemp;
  late String maxTemp;
  late String icon;
  late String date;
  late String sunSet;
  late String sunRise;


  Future<void > getData() async{
    try{
      http.Response response = await http.get(Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=$location&appid=4f949279eee2956ee55006fe7a73166f"));
      Map<String, dynamic> data = jsonDecode(response.body);

      //Getting Temp, Humidity
      Map<String, dynamic> temp_data = data['main'];
      double get_temp = temp_data['temp']-273.15;
      String get_humidity = temp_data['humidity'].toString();
      double get_feels_like = temp_data['feels_like']-273.15;
      double get_min_temp = temp_data['temp_min']-273.15;
      double get_max_temp = temp_data['temp_max']-273.15;

      //Getting Description
      List weather_data = data['weather'];
      Map<String, dynamic> weather_main_data = weather_data[0];
      String get_desc = weather_main_data['description'];
      String get_main_des = weather_main_data['main'];
      String get_icon = weather_main_data['icon'];

      //Getting Air Speed
      Map<String, dynamic> wind = data['wind'];
      double get_air_speed = wind['speed']/0.277778;

      //Getting Date
      int get_date = data['dt'];

      //Getting Sunset and Sunrise time
      Map<String, dynamic> sys = data['sys'];
      int get_sunset = sys['sunset'];
      int get_sunrise = sys['sunrise'];

      temperature = get_temp.toString();
      humidity = get_humidity ;
      airSpeed = get_air_speed.toString();
      description = get_desc;
      main = get_main_des;
      feelsLike = get_feels_like.toString();
      minTemp = get_min_temp.toString();
      maxTemp = get_max_temp.toString();
      icon = get_icon.toString();
      date = get_date.toString();
      sunSet = get_sunset.toString();
      sunRise = get_sunrise.toString();


    }catch(e){
      print(temperature = "Can't Find Data");
      humidity = "Can't Find Data" ;
      airSpeed = "Can't Find Data";
      description ="Can't Find Data";
      main = "Can't Find Data";
    }
  }
}




