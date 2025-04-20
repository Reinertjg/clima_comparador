import 'dart:io';

import 'package:clima_comparador/models/dados_climatico_model.dart';
import 'package:clima_comparador/services/gerar_relatorios.dart';

Future<void> processarMenu(List<DadoClimatico> dadosSP, List<DadoClimatico> dadosSC) async {
  try {
    var respostaUsuario = stdin.readLineSync();

    switch (respostaUsuario) {
      case "1":
        print("RELATORIO DE TEMPERATURA SELECIONADO");
        gerarRelatorios(dadosSP, dadosSC);
        break;
      case "2":
        print("RELATORIO DE UMIDADE SELECIONADO");
        gerarRelatoriosUmidade(dadosSP, dadosSC);
        break;
      case "3":
        print("RELATORIO DE DIREÇÃO DO VENTO SELECIONADO");
        gerarRelatoriosDirecao(dadosSP, dadosSC);
        break;
      default:
        print("ESTA OPÇÃO NÃO EXISTE!!");
        break;
    }
  } catch (e) {
    // Caso ocorra qualquer erro, a gente avisa e não deixa o app quebrar
    print('Ocorreu um erro ao processar sua escolha: $e');
  }
}
