part of 'weather_1_cubit.dart';

@immutable
sealed class Weather1State {}

final class Weather1Initial extends Weather1State {}

final class Weather1Loading extends Weather1State {}

final class Weather1Loaded extends Weather1State {
  final Map<String, dynamic> weatherData;
  Weather1Loaded(this.weatherData);
}

final class Weather1Error extends Weather1State {
  final String message;
  Weather1Error(this.message);
}
