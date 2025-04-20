import 'dart:io';

import 'package:clima_comparador/services/carregar_dados.dart';
import 'package:clima_comparador/views/menu.dart';
import 'package:clima_comparador/controllers/menu_controller.dart';

void main() async {




  // Carrega do dados
  final dadosSP = await carregarDadosPorEstado('SP');
  final dadosSC = await carregarDadosPorEstado('SC');

  // Imprime o Menu
  imprimirMenu();

  // Chama o metodo que lida com a resposta do usuário.
  await processarMenu(dadosSP, dadosSC);
}
