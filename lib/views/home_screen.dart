import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather5/controller/weather_controller.dart';

import 'package:weather5/utils/colors.dart';
import 'package:weather5/utils/const.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather5/views/location_screen.dart';
import 'package:weather5/views/setting_screen.dart';
//import 'package:weather_location/utils/colors.dart';


//import '../controller/weather_controller.dart';

//import '../controller/weather_controller.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  //late WeatherController weatherController;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherController>().getCurrentWeather();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weatherController =
        Provider.of<WeatherController>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(),
            kheight25,
            weatherController.isLoding
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : weatherController.weatherResponseModel == null
                    ? Center(
                        child: Text("No Data Existing"),
                      )
                    : Container(
                        padding: EdgeInsets.all(10),
                        width: 358,
                        height: 565,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [lightblue, darkblue],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LocationScreen()));
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: whitePrimary,
                                        size: 32,
                                      )),
                                  // Icon(
                                  //   Icons.add,
                                  //   color: whitePrimary,
                                  //   size: 32,
                                  // ),
                                  Text(
                                    //"Malang",
                                    weatherController
                                        .weatherResponseModel!.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: whitePrimary,
                                        fontSize: 16),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SettingScreen()));
                                    },
                                    icon: Icon(
                                      Icons.more_vert_rounded,
                                      color: whitePrimary,
                                      size: 32,
                                    ),
                                  )
                                ],
                              ),
                              //Image.network("https://png.pngtree.com/png-vector/20231019/ourmid/pngtree-cartoon-cloud-illustration-png-image_10211263.png"),
                              Image.asset(
                                  "assets/images/Sun cloud angled rain.png"),
                              Text(
                                "Sunday | Nov 14",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              Text(weatherController
                                        .weatherResponseModel!.main.temp.toString(),
                                  style: TextStyle(
                                      fontSize: 72,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                weatherController
                                        .weatherResponseModel!.weather[0].main,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              Divider(
                                color: Colors.white,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      kwidth25,
                                      SvgPicture.asset(
                                        "assets/svgs/location.svg",
                                        width: 25,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                      "${weatherController
                                        .weatherResponseModel!.wind.speed.toString()}km/hr" ,
                                        style: TextStyle(
                                            fontSize: 12, color: whitePrimary),
                                      ),
                                      Text(
                                        "Wind",
                                        style: TextStyle(
                                            fontSize: 12, color: whitePrimary),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: Row(
                                      children: [
                                        kwidth25,
                                        SvgPicture.asset(
                                          "assets/svgs/Group.svg",
                                          width: 25,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${weatherController.weatherResponseModel!.clouds.all}%",
                                        style: TextStyle(
                                            fontSize: 12, color: whitePrimary),
                                      ),
                                      Text(
                                        "Clouds",
                                        style: TextStyle(
                                            fontSize: 12, color: whitePrimary),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      kwidth25,
                                      SvgPicture.asset(
                                        "assets/svgs/temp.svg",
                                        width: 25,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${weatherController.weatherResponseModel!.main.pressure} mbar",
                                        style: TextStyle(
                                            fontSize: 12, color: whitePrimary),
                                      ),
                                      Text(
                                        "Pressure",
                                        style: TextStyle(
                                            fontSize: 12, color: whitePrimary),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40),
                                    child: Row(
                                      children: [
                                        kwidth25,
                                        SvgPicture.asset(
                                          "assets/svgs/hum.svg",
                                          width: 25,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${weatherController.weatherResponseModel!.main.humidity}",
                                        style: TextStyle(
                                            fontSize: 12, color: whitePrimary),
                                      ),
                                      Text(
                                        "Humidity",
                                        style: TextStyle(
                                            fontSize: 12, color: whitePrimary),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}