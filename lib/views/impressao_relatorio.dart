import 'package:clima_comparador/models/relatorio_sp_model.dart';
import 'package:clima_comparador/models/relatorio_sc_model.dart';
import 'package:clima_comparador/conversores/converter_dados.dart';
import 'package:yaansi/yaansi.dart';

class ImpressaoRelatorioTemp {
  final RelatorioTemperaturaModelSP dadoSP;
  final RelatorioTemperaturaModelSC dadoSC;

  ImpressaoRelatorioTemp(this.dadoSP, this.dadoSC);

  void imprimirTudoTemp() {
    print("\n============ Relatório Temperatura ============");
    imprimirMediaAnual();
    imprimirMediaMensal();
    imprimirMaximaAnual();
    imprimirMaximaMensal();
    imprimirMinimaAnual();
    imprimirMinimaMensal();
    imprimirMediaHora();
  }

  void imprimirMediaAnual() {
    print("\n>> TEMPERATURA MÉDIA ANUAL (2024)");

    void imprimirPorEstado(String estado, double media) {
      print(
        "   ESTADO: $estado / ${('$media °C').red} / "
            "${('${TemperaturaConverter.celsiusParaFahrenheit(media)} °F')
            .yellow} / "
            "${('${TemperaturaConverter.celsiusParaKelvin(media)} K').blue}",
      );
    }

    imprimirPorEstado("SP", dadoSP.mediaAnual);
    imprimirPorEstado("SC", dadoSC.mediaAnual);
  }

  void imprimirMediaMensal() {
    print("\n>> TEMPERATURA MÉDIA MENSAL POR ESTADO (2024)");

    void imprimirPorEstado(String estado, List medias) {
      print("   ESTADO: $estado");
      for (int i = 0; i < 12; i++) {
        final valor = medias[i];
        print(
          "     MÊS ${(i + 1).toString().padLeft(2, "0")}: ${('${valor
              .toStringAsFixed(2)} °C').red} / "
              "${('${TemperaturaConverter
              .celsiusParaFahrenheit(valor)
              .toStringAsFixed(2)} °F').yellow} / "
              "${('${TemperaturaConverter
              .celsiusParaKelvin(valor)
              .toStringAsFixed(2)} K').blue}",
        );
      }
    }

    imprimirPorEstado('SP', dadoSP.mediasMensais);
    imprimirPorEstado('SC', dadoSC.mediasMensais);
  }

  void imprimirMaximaAnual() {
    print("\n>> TEMPERATURA MÁXIMA ANUAL (2024)");

    void imprimirPorEstado(String estado, double maxima) {
      print(
        "   ESTADO: $estado / ${('${maxima.toStringAsFixed(2)} °C').red} / "
            "${('${TemperaturaConverter
            .celsiusParaFahrenheit(maxima)
            .toStringAsFixed(2)} °F').yellow} / "
            "${('${TemperaturaConverter
            .celsiusParaKelvin(maxima)
            .toStringAsFixed(2)} K').blue}",
      );
    }

    imprimirPorEstado("SP", dadoSP.maximaAnual);
    imprimirPorEstado("SC", dadoSC.maximaAnual);
  }

  void imprimirMaximaMensal() {
    print("\n>> TEMPERATURA MÁXIMA MENSAL (2024)");

    void imprimirPorEstado(String estado, List maxima) {
      print("   ESTADO: $estado");
      for (int i = 0; i < 12; i++) {
        final valor = maxima[i];
        print(
          "     MÊS ${(i + 1).toString().padLeft(2, "0")}: ${('${valor
              .toStringAsFixed(2)} °C').red} / "
              "${('${TemperaturaConverter
              .celsiusParaFahrenheit(valor)
              .toStringAsFixed(2)} °F').yellow} / "
              "${('${TemperaturaConverter
              .celsiusParaKelvin(valor)
              .toStringAsFixed(2)} K').blue}",
        );
      }
    }

    imprimirPorEstado("SP", dadoSP.maximasMensais);
    imprimirPorEstado("SC", dadoSC.maximasMensais);
  }

  void imprimirMinimaAnual() {
    print("\n>> TEMPERATURA MÍNIMA ANUAL (2024)");

    void imprimirPorEstado(String estado, double minima) {
      print(
        "   ESTADO: $estado / ${('${minima..toStringAsFixed(2)} °C').red} / "
            "${('${TemperaturaConverter
            .celsiusParaFahrenheit(minima)
            .toStringAsFixed(2)} °F').yellow} / "
            "${('${TemperaturaConverter
            .celsiusParaKelvin(minima)
            .toStringAsFixed(2)} K').blue}",
      );
    }

    imprimirPorEstado("SP", dadoSP.minimaAnual);
    imprimirPorEstado("SC", dadoSC.minimaAnual);
  }

  void imprimirMinimaMensal() {
    print("\n>> TEMPERATURA MÍNIMA MENSAL (2024)");

    void imprimirPorEstado(String estado, List minima) {
      print("   ESTADO: $estado");
      for (int i = 0; i < 12; i++) {
        final valor = minima[i];
        print(
          "     MÊS ${(i + 1).toString().padLeft(2, "0")}: ${('${valor
              .toStringAsFixed(2)} °C').red} / "
              "${('${TemperaturaConverter
              .celsiusParaFahrenheit(valor)
              .toStringAsFixed(2)} °F').yellow} / "
              "${('${TemperaturaConverter
              .celsiusParaKelvin(valor)
              .toStringAsFixed(2)} K').blue}",
        );
      }
    }

    imprimirPorEstado("SP", dadoSP.minimasMensais);
    imprimirPorEstado("SC", dadoSC.minimasMensais);
  }

  void imprimirMediaHora() {
    print("\n>> TEMPERATURA MÉDIA POR HORÁRIO (SP)");

    void imprimirPorEstado(String estado, List hora) {
      print("   ESTADO: $estado");
      for (int i = 0; i < 24; i++) {
        final valor = hora[i];
        print(
          "     HORA ${(i + 1).toString().padLeft(2, "0")}: ${('${valor
              .toStringAsFixed(2)} °C').red} / "
              "${('${TemperaturaConverter
              .celsiusParaFahrenheit(valor)
              .toStringAsFixed(2)} °F').yellow} / "
              "${('${TemperaturaConverter
              .celsiusParaKelvin(valor)
              .toStringAsFixed(2)} K').blue}",
        );
      }
    }

    imprimirPorEstado("SP", dadoSP.mediaHora);
    imprimirPorEstado("SC", dadoSC.mediaHora);
  }

}

class ImpressaoRelatorioUmi {
  final RelatorioUmidadeModelSP dadoSP;
  final RelatorioUmidadeModelSC dadoSC;

  ImpressaoRelatorioUmi(this.dadoSP, this.dadoSC);

  void imprimirTudo() {
    print("\n============ Relatório Umidade ============");
    imprimirMediaAnual();
    imprimirMediaMensal();
    imprimirMaximaAnual();
    imprimirMaximaMensal();
    imprimirMinimaAnual();
    imprimirMinimaMensal();
  }

  void imprimirMediaAnual() {
    print("\n>> UMIDADE DO AR MÉDIA ANUAL (2024)");

    void imprimirPorEstado(String estado, double media) {
      print("   ESTADO: $estado / ${('$media KG/KG').green}");
    }

    imprimirPorEstado("SP", dadoSP.mediaAnual);
    imprimirPorEstado("SC", dadoSC.mediaAnual);
  }

  void imprimirMediaMensal() {
    print("\n>> UMIDADE DO AR MÉDIA MENSAL POR ESTADO (2024)");

    void imprimirPorEstado(String estado, List medias) {
      print("   ESTADO: $estado");
      for (int i = 0; i < 12; i++) {
        final valor = medias[i];
        print(
          "     MÊS ${(i + 1).toString().padLeft(2, "0")}: ${('$valor KG/KG').green}");
      }
    }

    imprimirPorEstado('SP', dadoSP.mediasMensais);
    imprimirPorEstado('SC', dadoSC.mediasMensais);
  }

  void imprimirMaximaAnual() {
    print("\n>> UMIDADO DO AR MÁXIMA ANUAL (2024)");

    void imprimirPorEstado(String estado, double maxima) {
      print(
        "   ESTADO: $estado / ${('$maxima KG/KG').red}");
    }

    imprimirPorEstado("SP", dadoSP.maximaAnual);
    imprimirPorEstado("SC", dadoSC.maximaAnual);
  }

  void imprimirMaximaMensal() {
    print("\n>> UMIDADE DO AR MÁXIMA MENSAL (2024)");

    void imprimirPorEstado(String estado, List maxima) {
      print("   ESTADO: $estado");
      for (int i = 0; i < 12; i++) {
        final valor = maxima[i];
        print(
          "     MÊS ${(i + 1).toString().padLeft(2, "0")}: ${('$valor KG/KG').red}");
      }
    }

    imprimirPorEstado("SP", dadoSP.maximasMensais);
    imprimirPorEstado("SC", dadoSC.maximasMensais);
  }

  void imprimirMinimaAnual() {
    print("\n>> TEMPERATURA MÍNIMA ANUAL (2024)");

    void imprimirPorEstado(String estado, double minima) {
      print(
        "   ESTADO: $estado / ${('$minima KG/KG').blue} ");
    }

    imprimirPorEstado("SP", dadoSP.minimaAnual);
    imprimirPorEstado("SC", dadoSC.minimaAnual);
  }

  void imprimirMinimaMensal() {
    print("\n>> TEMPERATURA MÍNIMA MENSAL (2024)");

    void imprimirPorEstado(String estado, List minima) {
      print("   ESTADO: $estado");
      for (int i = 0; i < 12; i++) {
        final valor = minima[i];
        print(
          "     MÊS ${(i + 1).toString().padLeft(2, "0")}: ${('$valor KG/KG').blue}");
      }
    }

    imprimirPorEstado("SP", dadoSP.minimasMensais);
    imprimirPorEstado("SC", dadoSC.minimasMensais);
  }
}
