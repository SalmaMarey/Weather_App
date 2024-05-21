import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/business_logic/cubit/weather_1_cubit.dart';
import 'package:weather_app/presentation/screens/weather_details.dart';

class WeatherPage extends StatelessWidget {
  final TextEditingController _countryController = TextEditingController();

  WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 230),
              const Text(
                'Weather App',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 18),
              Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _countryController,
                    decoration: const InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: 'Enter country',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.purple, Colors.blue],
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();

                    final country = _countryController.text;
                    if (country.isNotEmpty) {
                      context.read<Weather1Cubit>().fetchWeather(country);
                    }

                    _countryController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: const Text(
                    'Get Weather',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              BlocConsumer<Weather1Cubit, Weather1State>(
                listener: (context, state) {
                  if (state is Weather1Loaded) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            WeatherDetailPage(weatherData: state.weatherData),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is Weather1Initial) {
                    return const Text(
                      'Enter a city to get weather information',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    );
                  } else if (state is Weather1Loading) {
                    return const CircularProgressIndicator();
                  } else if (state is Weather1Error) {
                    return Text(
                      'Error: ${state.message}',
                      style: const TextStyle(color: Colors.purple),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
