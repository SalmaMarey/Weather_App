import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'weather_1_state.dart';

class Weather1Cubit extends Cubit<Weather1State> {
  final String apiKey;
  final http.Client httpClient;

  Weather1Cubit({required this.apiKey, required this.httpClient}) : super(Weather1Initial());

  Future<void> fetchWeather(String city) async {
    emit(Weather1Loading());
    try {
      final response = await httpClient.get(Uri.parse('http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city'));
      if (response.statusCode == 200) {
        final weatherData = json.decode(response.body);
        emit(Weather1Loaded(weatherData));
      } else {
        emit(Weather1Error('Error fetching weather data'));
      }
    } catch (e) {
      emit(Weather1Error(e.toString()));
    }
  }
}