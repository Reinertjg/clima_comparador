// lib/main.dart
import 'dart:io';
import 'package:clima_comparador/services/carregar_dados.dart';
import 'package:clima_comparador/services/gerar_relatorios.dart';
import 'package:clima_comparador/views/menu.dart';

void main() async {
  imprimirMenu();

  // Carregar dados
  final dadosSP = await carregarDadosPorEstado('SP');
  final dadosSC = await carregarDadosPorEstado('SC');

  // Leitura da opção do usuário
  var respostaUsuario = stdin.readLineSync();

  switch (respostaUsuario) {
    case "1":
      print("Relatorio de temperatura selecionado");
      gerarRelatorios(dadosSP, dadosSC);
      break;
    case "2":
      print("Relatorio de umidade selecionado");
      gerarRelatoriosUmidade(dadosSP, dadosSC);
      break;
    case "3":
      print("Relatorio de direção do vento selecionado");
      break;
    default:
      print("Esta opcao nao existe");
      break;
  }

  // Gerar os relatórios
}
