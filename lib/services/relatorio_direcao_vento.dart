import 'package:clima_comparador/models/dados_climatico_model.dart';
import 'package:clima_comparador/conversores/converter_dados.dart';

class ProcessarDadosDir {
  final List<DadoClimatico> dados;

  ProcessarDadosDir(this.dados);

  // Calcula a direção do vento mais frequente no ano inteiro
  String calcularMaiorFrequenteAnual() {
    Map<int, int> mapaFrequencia = {};

    for (var dado in dados) {
      final direcao =
          dados
              .where((e) => e.direcaoVento == dado.direcaoVento)
              .map((e) => e.direcaoVento)
              .toList();

      if (mapaFrequencia.containsKey(dado.direcaoVento)) {
        continue;
      } else {
        mapaFrequencia[dado.direcaoVento] = direcao.length;
      }
    }

    int direcaoMaisFrequente = 0;
    int maiorFrequencia = 0;

    mapaFrequencia.forEach((direcao, frequencia) {
      if (frequencia > maiorFrequencia) {
        maiorFrequencia = frequencia;
        direcaoMaisFrequente = direcao;
      }
    });

    final total = dados.length;
    final percentual = (maiorFrequencia / total) * 100;

    return '$direcaoMaisFrequente° / ${DirecaoVentoConverter.grauParaRadianos(direcaoMaisFrequente)}rad (${percentual.toStringAsFixed(1)}%)';
  }

  // Calcula a direção do vento mais frequente para cada mês do ano
  List<String> calcularMaiorFrequenciaMensal() {
    List<String> maiorFrequenciaMensal = [];

    for (int mes = 1; mes <= 12; mes++) {
      final mapaFrequencia = <int, int>{};

      // Filtra dados do mês atual
      final dadosDoMes = dados.where((e) => e.mes == mes).toList();

      for (var dado in dadosDoMes) {
        mapaFrequencia[dado.direcaoVento] =
            (mapaFrequencia[dado.direcaoVento] ?? 0) + 1;
      }

      int direcaoMaisFrequente = 0;
      int maiorFrequencia = 0;

      mapaFrequencia.forEach((direcao, frequencia) {
        if (frequencia > maiorFrequencia) {
          direcaoMaisFrequente = direcao;
          maiorFrequencia = frequencia;
        }
      });

      final percentual =
          dadosDoMes.isNotEmpty
              ? (maiorFrequencia / dadosDoMes.length) * 100
              : 0.0;

      maiorFrequenciaMensal.add(
        '$direcaoMaisFrequente° / ${DirecaoVentoConverter.grauParaRadianos(direcaoMaisFrequente)}rad (${percentual.toStringAsFixed(1)}%)',
      );
    }

    return maiorFrequenciaMensal;
  }
}
