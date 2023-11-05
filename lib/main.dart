import 'package:cc_weather_app_task/pages/cities.dart';
import 'package:cc_weather_app_task/pages/forecast.dart';
import 'package:flutter/material.dart';
import 'package:cc_weather_app_task/get_data.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/': (context) => const Home(),
        '/Cities': (context) => const ManageCities(),
        '/Forecast': (context) => const Forecast(),
      },
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
        title: Center(
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Cities');
            },
            child: const Text('Vidyavihar',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 22)),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 145),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Text(
                        (snapshot.data!.temp).substring(0, 2),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 125,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return const Text(
                        "--",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 125,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  width: 2,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 80),
                  child: Text(
                    "\u2103",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            ),
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    snapshot.data!.weather,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                    ),
                  );
                } else {
                  return const Text(
                    "--",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: null,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.masks,
                      color: Colors.white,
                      size: 15,
                    ),
                    Text(
                      "  AQI 165",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 9, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "More Details",
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                      size: 22,
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.cloudy_snowing,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Today',
                        style: TextStyle(color: Colors.white),
                      ),
                      const Text(" | ", style: TextStyle(color: Colors.white)),
                      FutureBuilder(
                        future: getData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Text(snapshot.data!.weather,
                                style: const TextStyle(color: Colors.white));
                          } else {
                            return const Text('--',
                                style: TextStyle(color: Colors.white));
                          }
                        },
                      ),
                      const Spacer(),
                      FutureBuilder(
                        future: getData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                                String highTemp = snapshot.data!.tempMax;
                                String lowTemp = snapshot.data!.tempMin;
                            return Text('$highTemp\u00B0 / $lowTemp\u00B0',
                                style: const TextStyle(color: Colors.white));
                          } else {
                            return const Text('-\u00B0 / -\u00B0',
                                style: TextStyle(color: Colors.white));
                          }
                        },
                      ),
                    ],
                  ),
                ),
                DayTempWidget(Icons.cloudy_snowing, 'Tommorow', 'Haze',
                    '36\u00B0 / 24\u00B0'),
                DayTempWidget(Icons.cloudy_snowing, 'Sunday', 'Haze',
                    '36\u00B0 / 25\u00B0'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/Forecast');
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                  child: Text(
                    "5-day forecast",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TimeTempWidget("Now", "39\u00B0", Icons.wb_cloudy_rounded),
                TimeTempWidget("15:00", "39\u00B0", Icons.wb_cloudy_rounded),
                TimeTempWidget("16:00", "40\u00B0", Icons.wb_cloudy_rounded),
                TimeTempWidget("17:00", "39\u00B0", Icons.wb_cloudy_rounded),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<GetData> getData() async {
    GetData weatherData = GetData();
    await Future.delayed(const Duration(seconds: 5));
    return weatherData;
  }
}

class DayTempWidget extends StatelessWidget {
  final IconData myicon;
  final String lefttext1;
  final String lefttext2;
  final String righttext;

  DayTempWidget(this.myicon, this.lefttext1, this.lefttext2, this.righttext);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Row(
        children: <Widget>[
          Icon(
            myicon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            lefttext1,
            style: const TextStyle(color: Colors.white),
          ),
          const Text(" | ", style: TextStyle(color: Colors.white)),
          Text(lefttext2, style: const TextStyle(color: Colors.white)),
          const Spacer(),
          Text(righttext, style: const TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}

class TimeTempWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final IconData myicon;

  TimeTempWidget(this.text1, this.text2, this.myicon);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text1,
          style: TextStyle(color: Colors.grey[400], fontSize: 12),
        ),
        Text(
          text2,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        const SizedBox(
          height: 4,
        ),
        Icon(
          myicon,
          color: Colors.white,
        )
      ],
    );
  }
}
