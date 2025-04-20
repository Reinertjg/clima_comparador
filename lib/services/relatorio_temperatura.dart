import 'package:clima_comparador/models/dados_climatico_model.dart';
import 'package:statistics/statistics.dart';

class ProcessarDadosTemp {
  final List<DadoClimatico> dados;

  ProcessarDadosTemp(this.dados);

  // Calcula a média de temperatura para cada mês do ano
  List calcularMediaMensal() {
    List<double> mediasMensais = [];

    for (int i = 0; i < 12; i++) {
      var temperaturas =
          dados.where((e) => e.mes == i + 1).map((e) => e.temperatura).toList();
      mediasMensais.add(double.parse(temperaturas.mean.toStringAsFixed(2)));
    }

    return mediasMensais;
  }

  // Calcula a média de temperatura de todo o ano
  double calcularMediaAnual() {
    final temperaturas = dados.map((e) => e.temperatura).toList();
    return double.parse(temperaturas.mean.toStringAsFixed(2));
  }

  // Calcula a temperatura máxima registrada em cada mês
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

  // Calcula a temperatura mínima registrada em cada mês
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

  // Retorna a temperatura máxima registrada no ano inteiro
  double calcularMaximaAnual() {
    var temperaturas = dados.map((e) => e.temperatura).toList();
    var tempStatistics = temperaturas.statistics;
    return tempStatistics.max;
  }

  // Retorna a temperatura mínima registrada no ano inteiro
  double calcularMinimaAnual() {
    var temperaturas = dados.map((e) => e.temperatura).toList();
    var tempStatistics = temperaturas.statistics;
    return tempStatistics.min;
  }

  // Calcula a média de temperatura por hora ao longo do dia (de 1h até 24h)
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
