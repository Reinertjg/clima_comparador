class TemperaturaConverter {
  static double celsiusParaFahrenheit(double celsius) => double.parse(((celsius * 9 / 5) + 32).toStringAsFixed(2));
  static double celsiusParaKelvin(double celsius) => double.parse((celsius + 273.15).toStringAsFixed(2));
// ...
}
