import 'package:yaansi/yaansi.dart';
import 'package:clima_comparador/conversores/temperatura_converter.dart';

var converter = TemperaturaConverter();

class ImpressaoRelatorio {

  void cabecalho() {
    print("============ Relatório Temperatura ============\n");
  }

  void imprimirMediaAnual(double media) {
    cabecalho();
    print(">> TEMPERATURA MÉDIA ANUAL (SP) ");
    print("   2024: ${('$media °C').red} - "
        "${('${TemperaturaConverter.celsiusParaFahrenheit(media)} °F').yellow} - "
        "${('${TemperaturaConverter.celsiusParaKelvin(media)} K').blue}");
  }

  void imprimirMediaMensal(List media) {
    print(">> TEMPERATURA MÉDIA MENSAL (SP)");
    for (int i = 0; i < 12; i++) {
      print("   MÊS ${i + 1}: ${('${media[i]} °C').red} - "
          "${('${TemperaturaConverter.celsiusParaFahrenheit(media[i])} °F').yellow} - "
          "${('${TemperaturaConverter.celsiusParaKelvin(media[i])} K').blue}");
    }
  }

  void imprimirMaximaAnual(double maxima) {
    print(">> TEMPERATURA MAXIMA ANUAL (SP)");
    print("   2024: ${('$maxima°C').red} - "
        "${('${TemperaturaConverter.celsiusParaFahrenheit(maxima)} °F').yellow} - "
        "${('${TemperaturaConverter.celsiusParaKelvin(maxima)} K').blue}");
  }

  void imprimirMaximaMensal(List maxima) {
    print(">> TEMPERATURA MAXIMA MENSAL (SP)");
    for (int i = 0; i < 12; i++) {
      print("   MÊS ${i + 1}: ${('${maxima[i]} °C').red} - "
          "${('${TemperaturaConverter.celsiusParaFahrenheit(maxima[i])} °F').yellow} - "
          "${('${TemperaturaConverter.celsiusParaKelvin(maxima[i])} K').blue}");
    }
  }

  void imprimirMinimaAnual(double minima) {
    print(">> TEMPERATURA MINIMA ANUAL (SP)");
    print("   2024: ${('$minima °C').red} - "
        "${('${TemperaturaConverter.celsiusParaFahrenheit(minima)} °F').yellow} - "
        "${('${TemperaturaConverter.celsiusParaKelvin(minima)} K').blue}");
  }

  void imprimirMinimaMensal(List minima) {
    print(">> TEMPERATURA MINIMA MENSAL (SP)");
    for (int i = 0; i < 12; i++) {
      print("   MÊS ${i + 1}: ${('${minima[i]} °C').red} - "
          "${('${TemperaturaConverter.celsiusParaFahrenheit(minima[i])} °F').yellow} - "
          "${('${TemperaturaConverter.celsiusParaKelvin(minima[i])} K').blue}");
    }
  }

  void imprimirMediaHora(List media) {
    print(">> TEMPERATURA MÉDIA POR HORÁRIO (SP)");
    for (int i = 0; i < 24; i++) {
      print("   HORA ${i + 1}: ${('${media[i]} °C').red} - "
          "${('${TemperaturaConverter.celsiusParaFahrenheit(media[i])} °F').yellow} - "
          "${('${TemperaturaConverter.celsiusParaKelvin(media[i])} K').blue}");
    }
  }
}
