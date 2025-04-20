import 'dart:math';

class TemperaturaConverter {
  static double celsiusParaFahrenheit(double celsius) {
    try {
      // Calculando a conversão de Celsius para Fahrenheit e arredondando para 2 casas decimais
      return double.parse(((celsius * 9 / 5) + 32).toStringAsFixed(2));
    } catch (e) {
      // Se algo der errado durante a conversão, exibe o erro
      print('Erro ao converter Celsius para Fahrenheit: $e');
      return 0.0;  // Retorna um valor padrão
    }
  }

  static double celsiusParaKelvin(double celsius) {
    try {
      // Calculando a conversão de Celsius para Kelvin e arredondando para 2 casas decimais
      return double.parse((celsius + 273.15).toStringAsFixed(2));
    } catch (e) {
      // Se algo der errado durante a conversão, exibe o erro
      print('Erro ao converter Celsius para Kelvin: $e');
      return 0.0;  // Retorna um valor padrão
    }
  }
}

class DirecaoVentoConverter {
  static double grauParaRadianos(int grau) {
    try {
      // Converte o valor do grau para radianos e arredonda para 5 casas decimais
      return double.parse(((grau * pi) / 180).toStringAsFixed(5));
    } catch (e) {
      // Caso haja algum erro durante a conversão, exibimos uma mensagem de erro
      print('Erro ao converter grau para radianos: $e');
      return 0.0;  // Retorna um valor padrão
    }
  }
}
