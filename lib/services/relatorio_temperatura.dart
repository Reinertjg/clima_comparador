import 'package:clima_comparador/models/dados_climatico_sp.dart';
import 'package:statistics/statistics.dart';

class ProcessarDadosTemp {
  final List<DadoClimatico> dados;

  ProcessarDadosTemp(this.dados);

  List calcularMediaMensal() {
    List<double> mediasMensais = [];

    for (int i = 0; i < 12; i++) {
      var temperaturas =
          dados.where((e) => e.mes == i + 1).map((e) => e.temperatura).toList();
      mediasMensais.add(double.parse(temperaturas.mean.toStringAsFixed(2)));
    }

    return mediasMensais;
  }

  double calcularMediaAnual() {
    final temperaturas = dados.map((e) => e.temperatura).toList();
    return double.parse(temperaturas.mean.toStringAsFixed(2));
  }

  List calcularMaximaMensal() {
    List<double> maximaTempMensal = [];

    for (int i = 0; i < 12; i++) {
      var temperaturas =
          dados.where((e) => e.mes == i + 1).map((e) => e.temperatura).toList();
      var tempStatistics = temperaturas.statistics;
      maximaTempMensal.add(tempStatistics.max);
    }
    return maximaTempMensal;
  }

  List calcularMinimaMensal() {
    List<double> minimaTempMensal = [];

    for (int i = 0; i < 12; i++) {
      var temperaturas =
          dados.where((e) => e.mes == i + 1).map((e) => e.temperatura).toList();
      var tempStatistics = temperaturas.statistics;
      minimaTempMensal.add(tempStatistics.min);
    }
    return minimaTempMensal;
  }

  double calcularMaximaAnual() {
    var temperaturas = dados.map((e) => e.temperatura).toList();
    var tempStatistics = temperaturas.statistics;
    return tempStatistics.max;
  }

  double calcularMinimaAnual() {
    var temperaturas = dados.map((e) => e.temperatura).toList();
    var tempStatistics = temperaturas.statistics;
    return tempStatistics.min;
  }

  List<double> calcularMediaPorHorario() {
    List<double> mediaPorHora = [];
    for (int hora = 1; hora <= 24; hora++) {
      var temperaturas = dados
          .where((e) => e.hora == hora)
          .map((e) => e.temperatura).toList();
      mediaPorHora.add(double.parse(temperaturas.mean.toStringAsFixed(2)));
    }

    return mediaPorHora;
  }
}
