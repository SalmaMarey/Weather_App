import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/presentation/widgets/stack_widget.dart';

class WeatherDetailPage extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  const WeatherDetailPage({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    final currentWeather = weatherData['current'];
    final location = weatherData['location'];
    final tempC = currentWeather['temp_c'];

    final localTime = DateTime.parse(location['localtime']);

    final formattedDate = DateFormat('d MMM').format(localTime);

    String getWeatherImage(double temp) {
      if (temp >= 10 && temp < 15) {
        return 'assets/storm.png';
      } else if (temp >= 15 && temp < 20) {
        return 'assets/cloudy.png';
      } else if (temp >= 20 && temp < 25) {
        return 'assets/cloudy_day2.png';
      } else if (temp >= 25 && temp < 30) {
        return 'assets/cloudy_day3.png';
      } else if (temp >= 30 && temp < 40) {
        return 'assets/sun.png';
      }
      return 'assets/cloudy_day3.png';
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 18),
            Center(
              child: Text(
                'Weather in ${location['name']}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              'Today: $formattedDate',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 15),
            Image.asset(
              getWeatherImage(tempC),
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 8),
            const Text(
              'Thunderstorm',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text(
                      'Wind',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '${currentWeather['wind_kph']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Temp',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      ' ${currentWeather['temp_c']} °C',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Humidity',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      ' ${currentWeather['humidity']}%',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 28),
            const SizedBox(height: 260, child: StackWidget()),
          ],
        ),
      ),
    );
  }
}
