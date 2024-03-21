import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart' hide Worker;
import 'package:krishisewa/src/features/authentication/screens/home_screen/weather/worker/worker.dart';
import 'package:krishisewa/src/features/authentication/screens/home_screen/weather/weatherhome.dart';
import 'package:krishisewa/src/features/authentication/screens/location_services/locationservices.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String cityName = "Udaipur";
  late String temp;
  late String hum;
  late String air_speed;
  late String des;
  late String main;
  late String feels_like;
  late String min_temp;
  late String max_temp;
  late String icon_id;
  late String date;
  late String sunSetTime;
  late String sunRiseTime;
  late String city = "Udaipur";

  Future<void> startApp() async {
    Map<String, dynamic> locationData = await getCurrentLocation();
    city = locationData['city'] ?? 'Udaipur';
    print(city);

    setState(() {
      cityName = city;
    });

    late Worker instance = Worker.worker(location: cityName);
    await instance.getData();

    temp = instance.temperature;
    hum = instance.humidity;
    air_speed = instance.airSpeed;
    des = instance.description;
    main = instance.main;
    feels_like = instance.feelsLike;
    min_temp = instance.minTemp;
    max_temp = instance.maxTemp;
    icon_id = instance.icon;
    date = instance.date;
    sunSetTime = instance.sunSet;
    sunRiseTime = instance.sunRise;

    Future.delayed(const Duration(seconds: 1), () {
      Get.off(() => const Weather(), arguments: {
        "temp_value": temp,
        "hum_value": hum,
        "air_speed_value": air_speed,
        "des_value": des,
        "main_value": main,
        "city_value": cityName,
        "feels_like_value": feels_like,
        "min_temp_value": min_temp,
        "max_temp_value": max_temp,
        "icon_value": icon_id,
        "date_value": date,
        "sunSet_value": sunSetTime,
        "sunRise_value": sunRiseTime,
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startApp();
  }

  @override
  Widget build(BuildContext context) {
    final info_city = ModalRoute.of(context)?.settings.arguments as Map?;
    print(city);
    String temp = city.toString();
    if (info_city != null && info_city.isNotEmpty) {
      cityName = info_city['searchText'] ?? city;
    } else {
      cityName = city;
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/weather/loadingpage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(30),
          child: const Column(
            children: [
              Image(image: AssetImage('assets/images/weather/weather.png')),
              SizedBox(height: 30,),
              Text('Fetching Data...'),
              SizedBox(height: 30,),
              SpinKitWaveSpinner(color: Colors.black,size: 70,)
            ],
          ),
        ),
      ),
    );
  }
}
