import 'package:clima_comparador/models/dados_climatico_sp.dart';
import 'package:statistics/statistics.dart';

class ProcessarDadosUmi {
  final List<DadoClimatico> dados;

  ProcessarDadosUmi(this.dados);

  double calcularMediaAnual() {
    final umidade = dados.map((e) => e.umidadeKG).toList();
    return double.parse(umidade.mean.toStringAsFixed(5));
  }

  List calcularMediaMensal() {
    List<double> mediasMensais = [];

    for (int i = 0; i < 12; i++) {
      var umidade =
          dados.where((e) => e.mes == i + 1).map((e) => e.umidadeKG).toList();
      mediasMensais.add(double.parse(umidade.mean.toStringAsFixed(5)));
    }

    return mediasMensais;
  }

  List calcularMaximaMensal() {
    List<double> maximaUmiMensal = [];

    for (int i = 0; i < 12; i++) {
      var umidade =
          dados.where((e) => e.mes == i + 1).map((e) => e.umidadeKG).toList();
      var umiStatistics = umidade.statistics;
      maximaUmiMensal.add(double.parse(umiStatistics.max.toStringAsFixed(5)));
    }
    return maximaUmiMensal;
  }

  double calcularMaximaAnual() {
    var umidade = dados.map((e) => e.umidadeKG).toList();
    var umiStatistics = umidade.statistics;
    return double.parse(umiStatistics.max.toStringAsFixed(5));
  }

  double calcularMinimaAnual() {
    var umidade = dados.map((e) => e.umidadeKG).toList();
    var umiStatistics = umidade.statistics;
    return double.parse(umiStatistics.min.toStringAsFixed(5));
  }

  List calcularMinimaMensal() {
    List<double> minimaTempMensal = [];

    for (int i = 0; i < 12; i++) {
      var umidade =
      dados.where((e) => e.mes == i + 1).map((e) => e.umidadeKG).toList();
      var umiStatistics = umidade.statistics;
      minimaTempMensal.add(double.parse(umiStatistics.min.toStringAsFixed(5)));
    }
    return minimaTempMensal;
  }

}


