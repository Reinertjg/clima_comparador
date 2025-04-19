import 'package:clima_comparador/models/relatorio_temperatura_sp_model.dart';
import 'package:clima_comparador/models/relatorio_temperatura_sc_model.dart';
import 'package:clima_comparador/conversores/temperatura_converter.dart';
import 'package:yaansi/yaansi.dart';

class ImpressaoRelatorio {
  final RelatorioTemperaturaModelSP dadoSP;
  final RelatorioTemperaturaModelSC dadoSC;

  ImpressaoRelatorio(this.dadoSP, this.dadoSC);

  void cabecalho() {
    print("============ Relatório Temperatura ============\n");
  }

  void imprimirMediaAnual() {
    cabecalho();
    print(">> TEMPERATURA MÉDIA ANUAL (2024)");
    print("   SP: ${('${dadoSP.mediaAnual} °C').red} - "
        "${('${TemperaturaConverter.celsiusParaFahrenheit(dadoSP.mediaAnual)} °F').yellow} - "
        "${('${TemperaturaConverter.celsiusParaKelvin(dadoSP.mediaAnual)} K').blue}");
    print("   SC: ${('${dadoSC.mediaAnual} °C').red} - "
        "${('${TemperaturaConverter.celsiusParaFahrenheit(dadoSC.mediaAnual)} °F').yellow} - "
        "${('${TemperaturaConverter.celsiusParaKelvin(dadoSC.mediaAnual)} K').blue}");
  }

  void imprimirMediaMensal() {
    print(">> TEMPERATURA MÉDIA MENSAL (SP)");
    for (int i = 0; i < 12; i++) {
      final valor = dadoSP.mediasMensais[i];
      print("   MÊS ${i + 1}: ${('$valor °C').red} - "
          "${('${TemperaturaConverter.celsiusParaFahrenheit(valor)} °F').yellow} - "
          "${('${TemperaturaConverter.celsiusParaKelvin(valor)} K').blue}");
    }
  }

  void imprimirMaximaAnual() {
    print(">> TEMPERATURA MÁXIMA ANUAL (SP)");
    print("   2024: ${('${dadoSP.maximaAnual} °C').red} - "
        "${('${TemperaturaConverter.celsiusParaFahrenheit(dadoSP.maximaAnual)} °F').yellow} - "
        "${('${TemperaturaConverter.celsiusParaKelvin(dadoSP.maximaAnual)} K').blue}");
  }

  void imprimirMaximaMensal() {
    print(">> TEMPERATURA MÁXIMA MENSAL (SP)");
    for (int i = 0; i < 12; i++) {
      final valor = dadoSP.maximasMensais[i];
      print("   MÊS ${i + 1}: ${('$valor °C').red} - "
          "${('${TemperaturaConverter.celsiusParaFahrenheit(valor)} °F').yellow} - "
          "${('${TemperaturaConverter.celsiusParaKelvin(valor)} K').blue}");
    }
  }

  void imprimirMinimaAnual() {
    print(">> TEMPERATURA MÍNIMA ANUAL (SP)");
    print("   2024: ${('${dadoSP.minimaAnual} °C').red} - "
        "${('${TemperaturaConverter.celsiusParaFahrenheit(dadoSP.minimaAnual)} °F').yellow} - "
        "${('${TemperaturaConverter.celsiusParaKelvin(dadoSP.minimaAnual)} K').blue}");
  }

  void imprimirMinimaMensal() {
    print(">> TEMPERATURA MÍNIMA MENSAL (SP)");
    for (int i = 0; i < 12; i++) {
      final valor = dadoSP.minimasMensais[i];
      print("   MÊS ${i + 1}: ${('$valor °C').red} - "
          "${('${TemperaturaConverter.celsiusParaFahrenheit(valor)} °F').yellow} - "
          "${('${TemperaturaConverter.celsiusParaKelvin(valor)} K').blue}");
    }
  }

  void imprimirMediaHora() {
    print(">> TEMPERATURA MÉDIA POR HORÁRIO (SP)");
    for (int i = 0; i < 24; i++) {
      final valor = dadoSP.mediaHora[i];
      print("   HORA $i: ${('$valor °C').red} - "
          "${('${TemperaturaConverter.celsiusParaFahrenheit(valor)} °F').yellow} - "
          "${('${TemperaturaConverter.celsiusParaKelvin(valor)} K').blue}");
    }
  }
}
