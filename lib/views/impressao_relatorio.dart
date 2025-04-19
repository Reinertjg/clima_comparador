import 'package:yaansi/yaansi.dart';

class ImpressaoRelatorio {
  void cabecalho() {
    print("============ Relatório Temperatura ============\n");
  }

  void imprimirMediaAnual(double media) {
    cabecalho();
    print(">> TEMPERATURA MÉDIA ANUAL (SP) ");
    print("   2024: ${('$media°C').red}");
  }

  void imprimirMediaMensal(List media) {
    print(">> TEMPERATURA MÉDIA MENSAL (SP)");
    for (int i = 0; i < 12; i++) {
      print("   MÊS ${i + 1}: ${('${media[i]}°C').red}");
    }
  }

  void imprimirMaximaAnual(double maxima) {
    print(">> TEMPERATURA MAXIMA ANUAL (SP)");
    print("   2024: ${('$maxima°C').red}");
  }

  void imprimirMaximaMensal(List maxima) {
    print(">> TEMPERATURA MAXIMA MENSAL (SP)");
    for (int i = 0; i < 12; i++) {
      print("   MÊS ${i + 1}: ${('${maxima[i]}°C').red}");
    }
  }

  void imprimirMinimaAnual(double minima) {
    print(">> TEMPERATURA MINIMA ANUAL (SP)");
    print("   2024: ${('$minima°C').red}");
  }

  void imprimirMinimaMensal(List minima) {
    print(">> TEMPERATURA MINIMA MENSAL (SP)");
    for (int i = 0; i < 12; i++) {
      print("   MÊS ${i + 1}: ${('${minima[i]}°C').red}");
    }
  }

  void imprimirMediaHora(List media) {
    print(">> TEMPERATURA MÉDIA POR HORÁRIO (SP)");
    for (int i = 0; i < 24; i++) {
      print("   HORA ${i + 1}: ${('${media[i]}°C').red}");
    }
  }
}
