import 'package:clima_comparador/services/relatorioTemperatura.dart';

class impressaoRelatorio {

  void imprimirMediaPorEstadoPorAno(double mediaTemperaturaAnual) {
    print(">> MÉDIA POR ESTADO POR ANO (2024) \n"
        "   - SP: $mediaTemperaturaAnual °C");
  }
}

