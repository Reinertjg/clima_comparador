import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:clima_comparador/models/dados_climatico_model.dart';

class LeitorDados {
  // Função assíncrona que carrega os dados de um arquivo CSV e os converte em uma lista de objetos DadoClimatico.
  static Future<List<DadoClimatico>> leituraDados(String caminho) async {
    final arquivo = File(caminho);
    if (!await arquivo.exists()) return [];

    try {
      final conteudo = latin1.decode(await arquivo.readAsBytes());
      final linhas = CsvToListConverter().convert(conteudo).skip(1); // pula cabeçalho

      final dados = linhas.map((linha) => DadoClimatico.fromCsv(linha)).toList();

      // Caso o CSV esteja vazio ou com linhas malformadas
      if (dados.isEmpty) {
        throw FormatException("Arquivo vazio ou sem dados válidos");
      }

      return dados;
    } catch (e) {
      // Lança exceção para o chamador lidar (ex: imprimir resumo dos erros)
      throw Exception("Erro ao processar o arquivo $caminho: $e");
    }
  }
}

// Esta parte do código converte cada linha do arquivo CSV em um objeto DadoClimatico usando o metodo fromCsv()
// e retorna uma lista de objetos DadoClimatico para ser utilizada em outras partes do sistema.

