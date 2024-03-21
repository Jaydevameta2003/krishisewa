import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:krishisewa/src/features/authentication/screens/home_screen/navigation_menu.dart';
import 'package:krishisewa/src/features/authentication/screens/home_screen/weather/loading.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {

  TextEditingController searchController = TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var city_names = ["Udaipur", "Chandigarh", "Delhi", "Jaipur"];
    final _random = Random();
    var city = city_names[_random.nextInt(city_names.length)];

    final info = ModalRoute.of(context)?.settings.arguments as Map?;

    String temp = info != null && info['temp_value'] != null
        ? info['temp_value'].toString().length >= 4
        ? info['temp_value'].toString().substring(0, 4)
        : info['temp_value'].toString()
        : '';


    String main = (info?['main_value']);
    String desc = (info?['des_value']);
    String city_name = (info?['city_value']).toString();

    String air_speed = (info?['air_speed_value']).toString();
    if (air_speed.length >= 4) {
      air_speed = air_speed.substring(0, 4);
    }
    else{

    }

    String humidity = (info?['hum_value']).toString();
    String feels_like = info != null && info['feels_like_value'] != null
        ? (info['feels_like_value']).toString().substring(0, 4)
        : '';

    String min_temp = info != null && info['min_temp_value'] != null
        ? (info['min_temp_value']).toString().substring(0, 4)
        : '';

    String max_temp = info != null && info['max_temp_value'] != null
        ? (info['max_temp_value']).toString().substring(0, 4)
        : '';

    String icon = (info?['icon_value']).toString();
    String date_str = (info?['date_value']).toString();
    int date_int = int.parse(date_str);
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(date_int * 1000);
    String formattedDate = DateFormat('EEEE dd MMMM yyyy').format(dateTime);
    String formattedTime = DateFormat.jm().format(dateTime);

    String sunRise_str = (info?['sunRise_value']).toString();
    int sunRise_int = int.parse(sunRise_str);
    DateTime sunRiseTime = DateTime.fromMillisecondsSinceEpoch(sunRise_int * 1000);
    String formattedSunRiseTime = DateFormat.jm().format(sunRiseTime);

    String sunSet_str = (info?['sunSet_value']).toString();
    int sunSet_int = int.parse(sunSet_str);
    DateTime sunSetTime = DateTime.fromMillisecondsSinceEpoch(sunSet_int * 1000);
    String formattedSunSetTime = DateFormat.jm().format(sunSetTime);


    return WillPopScope(
      onWillPop: () async{
        Get.off(()=> const NavigationMenu());
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height*0.96,
              padding: const EdgeInsets.all(20),
              color: const Color(0xFFF8D893),
              child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      height: 55,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                          width: 2
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_pin),
                          const SizedBox(width: 10,),
                          Expanded(
                              child: TextField(
                                controller: searchController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search $city"
                                ),
                              )
                          ),
                          GestureDetector(
                            onTap: (){
                              if (searchController.text.isNotEmpty) {
                                Get.off(()=> const Loading(), arguments: {
                                  "searchText" : searchController.text,
                                });
                              } else {
                                Get.off(()=> const Loading(), arguments: {
                                  "searchText" : "Jaipur",
                                });
                              }
                            },
                            child: const Icon(Icons.search, size: 30,),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        height: 100,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.4)
                        ),
                        child: Row(
                          children: [
                            Expanded(child: Image.network("https://openweathermap.org/img/wn/$icon@2x.png")),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(city_name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                                  Text(main, style: const TextStyle(fontSize: 16),),
                                  Text(desc, style: const TextStyle(fontSize: 16),)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 230,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Image(image: AssetImage('assets/images/weather/temp.png'), width: 35,height: 35,),

                              Expanded(
                                child: Column(
                                  children: [
                                    Text(formattedDate,style: TextStyle(fontSize: 16),),
                                    Text(formattedTime, style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(temp, style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w800),),
                              const SizedBox(width: 20,),
                              const Text('°C', style: TextStyle(fontSize: 30),)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Feels like : ', style: TextStyle(fontSize: 18),),
                              Text(feels_like, style: const TextStyle(fontSize: 18),),
                              const SizedBox(width: 10,),
                              const Text('°C', style: TextStyle(fontSize: 18))
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      height: 290,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    padding: const EdgeInsets.all(8),
                                    height: 140,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.4),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Image(image: AssetImage('assets/images/weather/sunrise.png'), height: 45,width: 45,),
                                            SizedBox(width: 20,),
                                            Column(
                                              children: [
                                                Text('Sunrise', style: TextStyle(fontSize: 16),),
                                                Text('Time', style: TextStyle(fontSize: 16),)
                                              ],
                                            )
                                          ],
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(formattedSunRiseTime, style: TextStyle(fontSize: 25),),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),

                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    padding: const EdgeInsets.all(8),
                                    height: 140,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.4),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Image(image: AssetImage('assets/images/weather/sunset.png'), height: 45,width: 45,),
                                            SizedBox(width: 20,),
                                            Column(
                                              children: [
                                                Text('Sunset', style: TextStyle(fontSize: 16),),
                                                Text('Time', style: TextStyle(fontSize: 16),)
                                              ],
                                            )
                                          ],
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(formattedSunSetTime, style: const TextStyle(fontSize: 25),),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),

                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    padding: const EdgeInsets.all(8),
                                    height: 170,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Image(image: AssetImage('assets/images/weather/wind.png'), height: 45,width: 45,),
                                            SizedBox(width: 20,),
                                            Text('Wind', style: TextStyle(fontSize: 16),)
                                          ],
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(air_speed, style: TextStyle(fontSize: 40),),
                                              Text('km/hr')
                                            ],
                                          ),
                                        )
                                      ],
                                    ),

                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    padding: const EdgeInsets.all(8),
                                    height: 170,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.4),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Image(image: AssetImage('assets/images/weather/humidity.png'), height: 45,width: 45,),
                                            Text('Humidity', style: TextStyle(fontSize: 16),)
                                          ],
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(humidity, style: const TextStyle(fontSize: 40),),
                                              const Text('%')
                                            ],
                                          ),
                                        )
                                      ],
                                    ),

                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    margin: EdgeInsets.only(right: 5),
                                    height: 170,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.4),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Image(image: AssetImage('assets/images/weather/mintemp.png'), height: 45,width: 45,),
                                            Text('Min Temp', style: TextStyle(fontSize: 16),)
                                          ],
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(min_temp, style: const TextStyle(fontSize: 40),),
                                              const Text('°C')
                                            ],
                                          ),
                                        )
                                      ],
                                    ),

                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    margin: EdgeInsets.only(left: 5),
                                    height: 170,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.4),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Image(image: AssetImage('assets/images/weather/maxtemp.png'), height: 45,width: 45,),
                                            Text('Max Temp', style: TextStyle(fontSize: 16),)
                                          ],
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(max_temp, style: const TextStyle(fontSize: 40),),
                                              const Text('°C')
                                            ],
                                          ),
                                        )
                                      ],
                                    ),

                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
