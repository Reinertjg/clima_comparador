import 'package:clima_comparador/models/dados_climatico_sp.dart';
import 'package:statistics/statistics.dart';

class processarDadosTemp {
  final List<DadoClimatico> dados;

  processarDadosTemp(this.dados);

  List calcularMediaMensal() {
    List<double> mediasMensais = [];

    for (int mes = 0; mes < 12; mes++) {
      List<double> listaMensal = [];

      for (var lista in dados.skip(1)) {
        if (lista.mes == mes + 1) {
          // Pula o cabeçalho
          var temp = double.tryParse(
            lista.temperatura.toString().replaceAll(',', '.'),
          ); // Troca vírgula por ponto se precisar
          if (temp == null) continue;

          listaMensal.add(temp);
        }
      }
      mediasMensais.add(double.parse(listaMensal.mean.toStringAsFixed(2)));
    }
    return mediasMensais;
  }

  double calcularMediaAnual() {
    final temperaturas = dados.map((e) => e.temperatura).toList();
    return temperaturas.reduce((a, b) => a + b) / temperaturas.length;
  }
  //
  // List calcularMaximaMensal() {
  //   List<double> maximaTempMensal = [];
  //   double maiorTemperatura = 0.0;
  //
  //   for (int i = 0; i < 12; i++) {
  //     double maiorTemperatura = 0.0;
  //
  //     for (var lista in dados.skip(1)) {
  //       if (lista[0] == i + 1) {
  //         // Pula o cabeçalho
  //         var temp = double.tryParse(
  //           lista[3].toString().replaceAll(',', '.'),
  //         ); // Troca vírgula por ponto se precisar
  //         if (temp == null) continue;
  //
  //         if (maiorTemperatura < temp) {
  //           maiorTemperatura = temp;
  //         }
  //       }
  //     }
  //     maximaTempMensal.add(maiorTemperatura);
  //   }
  //   return maximaTempMensal;
  // }
  //
  // List calcularMinimaMensal() {
  //   List<double> minimaTempMensal = [];
  //
  //   for (int i = 0; i < 12; i++) {
  //     double menorTemperatura = 99.0;
  //
  //     for (var lista in dados.skip(1)) {
  //       if (lista[0] == i + 1) {
  //         // Pula o cabeçalho
  //         var temp = double.tryParse(
  //           lista[3].toString().replaceAll(',', '.'),
  //         ); // Troca vírgula por ponto se precisar
  //         if (temp == null) continue;
  //
  //         if (menorTemperatura < temp) {
  //           menorTemperatura = temp;
  //         }
  //       }
  //     }
  //     minimaTempMensal.add(menorTemperatura);
  //
  //   }
  //   return minimaTempMensal;
  // }
  //
  // double calcularMaximaAnual() {
  //   double maiorTemperaturaAnual = 0.0;
  //
  //   for (var lista in dados.skip(1)) {
  //     var temp = double.tryParse(
  //       lista[3].toString().replaceAll(',', '.'),
  //     ); // Troca vírgula por ponto se precisar
  //     if (temp == null) continue;
  //
  //     if (maiorTemperaturaAnual < temp) {
  //       maiorTemperaturaAnual = temp;
  //     }
  //
  //   }
  //   return maiorTemperaturaAnual;
  // }
  //
  // double calcularMinimaAnual() {
  //   double MenorTemperaturaAnual = 99.0;
  //
  //   for (var lista in dados.skip(1)) {
  //     var temp = double.tryParse(
  //       lista[3].toString().replaceAll(',', '.'),
  //     ); // Troca vírgula por ponto se precisar
  //     if (temp == null) continue;
  //
  //     if (MenorTemperaturaAnual < temp) {
  //       MenorTemperaturaAnual = temp;
  //     }
  //
  //   }
  //   return MenorTemperaturaAnual;
  //
  // }

// Map<String, double> calcularMediaPorHorario() { /* ... */ }
  }
