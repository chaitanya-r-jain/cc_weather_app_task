import 'package:flutter/material.dart';

class Forecast extends StatelessWidget {
  const Forecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(19, 0, 0, 0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(31, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "5-day forecast",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 28,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 0,
                color: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Column(
                    children: [
                      Text(
                        'Today',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '6/10',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Icon(
                        Icons.cloudy_snowing,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text('40\u00B0'),
                      const SizedBox(
                        height: 53,
                      ),
                      const Text('23\u00B0'),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                          height: 40,
                          child: Image.asset('assets/images/moon.png')),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            size: 20,
                            color: Colors.grey[600],
                          ),
                          const Text('23.5')
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const ForecastCardWidget(
                  'Tomorrow', '7/10', 40.0, 53.0, 30.0, 36, 24, 18.5),
              const ForecastCardWidget('Sun', '8/10', 40.0, 53.0, 30.0, 36, 25, 18.5),
              const ForecastCardWidget('Mon', '9/10', 40.0, 53.0, 30.0, 36, 25, 18.5),
              const ForecastCardWidget(
                  'Tue', '10/10', 40.0, 53.0, 30.0, 36, 22, 18.5),
            ],
          )
        ],
      ),
    );
  }
}

class ForecastCardWidget extends StatelessWidget {
  final String Date;
  final String Day;
  final double size1;
  final double size2;
  final double size3;
  final int temp1;
  final int temp2;
  final double speed;

  const ForecastCardWidget(this.Day, this.Date, this.size1, this.size2, this.size3,
      this.temp1, this.temp2, this.speed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        children: [
          Text(
            Day,
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            Date,
            style: TextStyle(color: Colors.grey[400]),
          ),
          const SizedBox(
            height: 20,
          ),
          Icon(
            Icons.cloudy_snowing,
            color: Colors.grey[400],
          ),
          SizedBox(
            height: size1,
          ),
          Text('$temp1\u00B0'),
          SizedBox(
            height: size2,
          ),
          Text('$temp2\u00B0'),
          SizedBox(
            height: size3,
          ),
          SizedBox(height: 40, child: Image.asset('assets/images/moon.png')),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(
                Icons.arrow_upward,
                size: 20,
                color: Colors.grey[600],
              ),
              Text('$speed')
            ],
          )
        ],
      ),
    );
  }
}
