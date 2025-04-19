import 'dart:io';
import 'package:clima_comparador/services/leitura_dados.dart';
import 'package:clima_comparador/models/dados_climatico_sp.dart';
import 'package:clima_comparador/services/relatorioTemperatura.dart';
import 'package:clima_comparador/views/impressao_relatorio.dart';
import 'package:clima_comparador/views/menu.dart';

void main() async {

  imprimirMenu();

  List<DadoClimatico> todosOsDados = [];

  for (int i = 1; i <= 12; i++) {
    final caminho = 'C:/CLIMA/SENSORES/SP_2024_$i.csv';
    todosOsDados += await leitorDados.carregarDados(caminho);
  }


  final processador = processarDadosTemp(todosOsDados);
  final mediaMensalTemp = processador.calcularMediaMensal();

  final impressora = ImpressaoRelatorio();
  impressora.imprimirMediaMensal(mediaMensalTemp);

}
