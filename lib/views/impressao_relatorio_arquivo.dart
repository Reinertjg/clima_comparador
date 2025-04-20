import 'package:clima_comparador/models/relatorio_sp_model.dart';
import 'package:clima_comparador/models/relatorio_sc_model.dart';
import 'package:clima_comparador/conversores/converter_dados.dart';

class ImpressaoRelatorioTempArquivo {
  final RelatorioTemperaturaModelSP dadoSP;
  final RelatorioTemperaturaModelSC dadoSC;

  ImpressaoRelatorioTempArquivo(this.dadoSP, this.dadoSC);

  String gerarRelatorioTemperatura() {
    final buffer = StringBuffer();

    buffer.writeln("\n============ Relatório Temperatura ============\n");
    buffer.writeln(imprimirMediaAnual());
    buffer.writeln(imprimirMediaMensal());
    buffer.writeln(imprimirMaximaAnual());
    buffer.writeln(imprimirMaximaMensal());
    buffer.writeln(imprimirMinimaAnual());
    buffer.writeln(imprimirMinimaMensal());
    buffer.writeln(imprimirMediaHora());

    return buffer.toString();
  }

  String imprimirMediaAnual() {
    final buffer = StringBuffer();
    buffer.writeln(">> TEMPERATURA MÉDIA ANUAL (2024)");

    void porEstado(String estado, double media) {
      buffer.writeln("   ESTADO: $estado / ${media.toStringAsFixed(2)} °C / "
          "${TemperaturaConverter.celsiusParaFahrenheit(media).toStringAsFixed(2)} °F / "
          "${TemperaturaConverter.celsiusParaKelvin(media).toStringAsFixed(2)} K");
    }

    porEstado("SP", dadoSP.mediaAnual);
    porEstado("SC", dadoSC.mediaAnual);
    return buffer.toString();
  }

  String imprimirMediaMensal() {
    final buffer = StringBuffer();
    buffer.writeln(">> TEMPERATURA MÉDIA MENSAL POR ESTADO (2024)");

    void porEstado(String estado, List medias) {
      buffer.writeln("   ESTADO: $estado");
      for (int i = 0; i < 12; i++) {
        final valor = medias[i];
        buffer.writeln("     MÊS ${(i + 1).toString().padLeft(2, "0")}: ${valor.toStringAsFixed(2)} °C / "
            "${TemperaturaConverter.celsiusParaFahrenheit(valor).toStringAsFixed(2)} °F / "
            "${TemperaturaConverter.celsiusParaKelvin(valor).toStringAsFixed(2)} K");
      }
    }

    porEstado('SP', dadoSP.mediasMensais);
    porEstado('SC', dadoSC.mediasMensais);
    return buffer.toString();
  }

  String imprimirMaximaAnual() {
    final buffer = StringBuffer();
    buffer.writeln(">> TEMPERATURA MÁXIMA ANUAL (2024)");

    void porEstado(String estado, double maxima) {
      buffer.writeln("   ESTADO: $estado / ${maxima.toStringAsFixed(2)} °C / "
          "${TemperaturaConverter.celsiusParaFahrenheit(maxima).toStringAsFixed(2)} °F / "
          "${TemperaturaConverter.celsiusParaKelvin(maxima).toStringAsFixed(2)} K");
    }

    porEstado("SP", dadoSP.maximaAnual);
    porEstado("SC", dadoSC.maximaAnual);
    return buffer.toString();
  }

  String imprimirMaximaMensal() {
    final buffer = StringBuffer();
    buffer.writeln(">> TEMPERATURA MÁXIMA MENSAL (2024)");

    void porEstado(String estado, List maximas) {
      buffer.writeln("   ESTADO: $estado");
      for (int i = 0; i < 12; i++) {
        final valor = maximas[i];
        buffer.writeln("     MÊS ${(i + 1).toString().padLeft(2, "0")}: ${valor.toStringAsFixed(2)} °C / "
            "${TemperaturaConverter.celsiusParaFahrenheit(valor).toStringAsFixed(2)} °F / "
            "${TemperaturaConverter.celsiusParaKelvin(valor).toStringAsFixed(2)} K");
      }
    }

    porEstado('SP', dadoSP.maximasMensais);
    porEstado('SC', dadoSC.maximasMensais);
    return buffer.toString();
  }

  String imprimirMinimaAnual() {
    final buffer = StringBuffer();
    buffer.writeln(">> TEMPERATURA MÍNIMA ANUAL (2024)");

    void porEstado(String estado, double minima) {
      buffer.writeln("   ESTADO: $estado / ${minima.toStringAsFixed(2)} °C / "
          "${TemperaturaConverter.celsiusParaFahrenheit(minima).toStringAsFixed(2)} °F / "
          "${TemperaturaConverter.celsiusParaKelvin(minima).toStringAsFixed(2)} K");
    }

    porEstado("SP", dadoSP.minimaAnual);
    porEstado("SC", dadoSC.minimaAnual);
    return buffer.toString();
  }

  String imprimirMinimaMensal() {
    final buffer = StringBuffer();
    buffer.writeln(">> TEMPERATURA MÍNIMA MENSAL (2024)");

    void porEstado(String estado, List minimas) {
      buffer.writeln("   ESTADO: $estado");
      for (int i = 0; i < 12; i++) {
        final valor = minimas[i];
        buffer.writeln("     MÊS ${(i + 1).toString().padLeft(2, "0")}: ${valor.toStringAsFixed(2)} °C / "
            "${TemperaturaConverter.celsiusParaFahrenheit(valor).toStringAsFixed(2)} °F / "
            "${TemperaturaConverter.celsiusParaKelvin(valor).toStringAsFixed(2)} K");
      }
    }

    porEstado('SP', dadoSP.minimasMensais);
    porEstado('SC', dadoSC.minimasMensais);
    return buffer.toString();
  }

  String imprimirMediaHora() {
    final buffer = StringBuffer();
    buffer.writeln(">> TEMPERATURA MÉDIA POR HORÁRIO (2024)");

    void porEstado(String estado, List horas) {
      buffer.writeln("   ESTADO: $estado");
      for (int i = 0; i < 24; i++) {
        final valor = horas[i];
        buffer.writeln("     HORA ${i.toString().padLeft(2, "0")}: ${valor.toStringAsFixed(2)} °C / "
            "${TemperaturaConverter.celsiusParaFahrenheit(valor).toStringAsFixed(2)} °F / "
            "${TemperaturaConverter.celsiusParaKelvin(valor).toStringAsFixed(2)} K");
      }
    }

    porEstado('SP', dadoSP.mediaHora);
    porEstado('SC', dadoSC.mediaHora);
    return buffer.toString();
  }
}


class ImpressaoRelatorioUmiArquivo {
  final RelatorioUmidadeModelSP dadoSP;
  final RelatorioUmidadeModelSC dadoSC;

  ImpressaoRelatorioUmiArquivo(this.dadoSP, this.dadoSC);

  // Retorna o relatório como string
  String gerarRelatorioUmidade() {
    final buffer = StringBuffer();

    buffer.writeln("\n============ Relatório Umidade ============");
    imprimirMediaAnual(buffer);
    imprimirMediaMensal(buffer);
    imprimirMaximaAnual(buffer);
    imprimirMaximaMensal(buffer);
    imprimirMinimaAnual(buffer);
    imprimirMinimaMensal(buffer);

    return buffer.toString();
  }

  void imprimirMediaAnual(StringBuffer buffer) {
    buffer.writeln("\n>> UMIDADE DO AR MÉDIA ANUAL (2024)");

    void imprimirPorEstado(String estado, double media) {
      buffer.writeln("   ESTADO: $estado / ${media.toStringAsFixed(5)} KG/KG");
    }

    imprimirPorEstado("SP", dadoSP.mediaAnual);
    imprimirPorEstado("SC", dadoSC.mediaAnual);
  }

  void imprimirMediaMensal(StringBuffer buffer) {
    buffer.writeln("\n>> UMIDADE DO AR MÉDIA MENSAL POR ESTADO (2024)");

    void imprimirPorEstado(String estado, List medias) {
      buffer.writeln("   ESTADO: $estado");
      for (int i = 0; i < 12; i++) {
        final valor = medias[i];
        buffer.writeln(
          "     MÊS ${(i + 1).toString().padLeft(2, "0")}: ${valor.toStringAsFixed(5)} KG/KG",
        );
      }
    }

    imprimirPorEstado('SP', dadoSP.mediasMensais);
    imprimirPorEstado('SC', dadoSC.mediasMensais);
  }

  void imprimirMaximaAnual(StringBuffer buffer) {
    buffer.writeln("\n>> UMIDADE DO AR MÁXIMA ANUAL (2024)");

    void imprimirPorEstado(String estado, double maxima) {
      buffer.writeln("   ESTADO: $estado / ${maxima.toStringAsFixed(5)} KG/KG");
    }

    imprimirPorEstado("SP", dadoSP.maximaAnual);
    imprimirPorEstado("SC", dadoSC.maximaAnual);
  }

  void imprimirMaximaMensal(StringBuffer buffer) {
    buffer.writeln("\n>> UMIDADE DO AR MÁXIMA MENSAL (2024)");

    void imprimirPorEstado(String estado, List maxima) {
      buffer.writeln("   ESTADO: $estado");
      for (int i = 0; i < 12; i++) {
        final valor = maxima[i];
        buffer.writeln(
          "     MÊS ${(i + 1).toString().padLeft(2, "0")}: ${valor.toStringAsFixed(5)} KG/KG",
        );
      }
    }

    imprimirPorEstado("SP", dadoSP.maximasMensais);
    imprimirPorEstado("SC", dadoSC.maximasMensais);
  }

  void imprimirMinimaAnual(StringBuffer buffer) {
    buffer.writeln("\n>> UMIDADE DO AR MÍNIMA ANUAL (2024)");

    void imprimirPorEstado(String estado, double minima) {
      buffer.writeln("   ESTADO: $estado / ${minima.toStringAsFixed(5)} KG/KG");
    }

    imprimirPorEstado("SP", dadoSP.minimaAnual);
    imprimirPorEstado("SC", dadoSC.minimaAnual);
  }

  void imprimirMinimaMensal(StringBuffer buffer) {
    buffer.writeln("\n>> UMIDADE DO AR MÍNIMA MENSAL (2024)");

    void imprimirPorEstado(String estado, List minima) {
      buffer.writeln("   ESTADO: $estado");
      for (int i = 0; i < 12; i++) {
        final valor = minima[i];
        buffer.writeln(
          "     MÊS ${(i + 1).toString().padLeft(2, "0")}: ${valor.toStringAsFixed(5)} KG/KG",
        );
      }
    }

    imprimirPorEstado("SP", dadoSP.minimasMensais);
    imprimirPorEstado("SC", dadoSC.minimasMensais);
  }
}


class ImpressaoRelatorioDirArquivo {
  final RelatorioDirecaoModelSP dadoSP;
  final RelatorioDirecaoModelSC dadoSC;

  ImpressaoRelatorioDirArquivo(this.dadoSP, this.dadoSC);

  // Chama todos os outros métodos de impressão
  String gerarRelatorioDirecao() {
    final buffer = StringBuffer();

    buffer.writeln("\n============ Relatório Direção do Vento ============\n");
    imprimirMaiorFrequenciaAnual(buffer);
    imprimirMaiorFrequenciaMensal(buffer);

    return buffer.toString();
  }

  void imprimirMaiorFrequenciaAnual(StringBuffer buffer) {
    buffer.writeln("\n>> DIREÇÃO DO VENTO MAIOR FREQUÊNCIA ANUAL (2024)");

    void imprimirPorEstado(String estado, String maxima) {
      buffer.writeln("   ESTADO: $estado / $maxima");
    }

    imprimirPorEstado("SP", dadoSP.maximaAnual);
    imprimirPorEstado("SC", dadoSC.maximaAnual);
  }

  void imprimirMaiorFrequenciaMensal(StringBuffer buffer) {
    buffer.writeln("\n>> DIREÇÃO DO VENTO MAIOR FREQUÊNCIA MENSAL (2024)");

    void imprimirPorEstado(String estado, List maxima) {
      buffer.writeln("   ESTADO: $estado");
      for (int i = 0; i < 12; i++) {
        final valor = maxima[i];
        buffer.writeln(
          "     MÊS ${(i + 1).toString().padLeft(2, "0")}: $valor",
        );
      }
    }

    imprimirPorEstado('SP', dadoSP.maximaMensal);
    imprimirPorEstado('SC', dadoSC.maximaMensal);
  }
}
