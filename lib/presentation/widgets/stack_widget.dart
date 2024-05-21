import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> temperatures = [12, 18, 22, 28];
    final List<String> times = ["12:00", "14:00", "16:00", "18:00"];

    String getWeatherImage(double temp) {
      if (temp >= 10 && temp < 15) {
        return 'assets/strom.png';
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

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.purple, Colors.blue],
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              Row(
                children: [
                  Text(
                    'Next Week',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.white,
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (index) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 100,
                    width: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          times[index],
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${temperatures[index]}°C',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -10,
                    left: 17,
                    child: Image.asset(
                      getWeatherImage(temperatures[index].toDouble()),
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              );
            }),
          ),
          const SizedBox(height: 20),
          Container(
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.home_outlined,
                  color: Colors.purple,
                  size: 30,
                ),
                Icon(
                  Icons.explore_outlined,
                  color: Colors.purple,
                  size: 30,
                ),
                Icon(
                  Icons.search,
                  color: Colors.purple,
                  size: 30,
                ),
                Icon(
                  Icons.person_outline,
                  color: Colors.purple,
                  size: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
