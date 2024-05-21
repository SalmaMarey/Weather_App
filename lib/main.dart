import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/business_logic/cubit/weather_1_cubit.dart';
import 'package:weather_app/presentation/screens/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: BlocProvider(
        create: (context) => Weather1Cubit(
          apiKey: 'b469506e39c04ef2816185840241705',
          httpClient: http.Client(),
        ),
        child: WeatherPage(),
      ),
    );
  }
}
