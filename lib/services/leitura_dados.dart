import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:clima_comparador/models/dados_climatico_sp.dart';

class LeitorDados{
  static Future<List<DadoClimatico>> carregarDados(String caminho) async {
    final arquivo = File(caminho);
    if (!await arquivo.exists()) return [];

    final conteudo = latin1.decode(await arquivo.readAsBytes());
    final linhas = CsvToListConverter().convert(conteudo).skip(1); // pula cabeçalho

    return linhas.map((linha) => DadoClimatico.fromCsv(linha)).toList();
  }
}
