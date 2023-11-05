import 'package:flutter/material.dart';

class ManageCities extends StatelessWidget {
  const ManageCities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(27, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Manage cities",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 28,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 0,
              color: Colors.grey[100],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.grey[500],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Enter location",
                      style: TextStyle(color: Colors.grey[500]),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              CityTempWidget("Vidyavihar", 165, 40, 23, 39),
              CityTempWidget("Delhi", 158, 39, 24, 37)
            ],
          )
        ],
      ),
    );
  }
}

class CityTempWidget extends StatelessWidget {
  final String location;
  final int aqi;
  final int deg1;
  final int deg2;
  final int mytemp;

  CityTempWidget(this.location, this.aqi, this.deg1, this.deg2, this.mytemp);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Card(
        color: const Color(0xFF475159),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 22),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        location,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const Icon(
                        Icons.location_pin,
                        size: 18,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "AQI $aqi    $deg1\u00B0 / $deg2\u00B0",
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
              const Spacer(),
              Text(
                "$mytemp\u00B0",
                style: const TextStyle(fontSize: 38, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
