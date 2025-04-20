// lib/services/carregar_dados.dart
import 'package:clima_comparador/models/dados_climatico_sp.dart';
import 'package:clima_comparador/services/leitura_dados.dart';

Future<List<DadoClimatico>> carregarDadosPorEstado(String estado) async {
  List<DadoClimatico> dados = [];
  for (int i = 1; i <= 12; i++) {
    final caminho = 'C:/CLIMA/SENSORES/${estado}_2024_$i.csv';
    dados += await LeitorDados.carregarDados(caminho);
  }
  return dados;
}
