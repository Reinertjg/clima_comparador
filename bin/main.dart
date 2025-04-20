import 'package:clima_comparador/models/relatorio_temperatura_sc_model.dart';
import 'package:clima_comparador/services/leitura_dados.dart';
import 'package:clima_comparador/models/dados_climatico_sp.dart';
import 'package:clima_comparador/services/relatorio_temperatura.dart';
import 'package:clima_comparador/views/impressao_relatorio.dart';
import 'package:clima_comparador/views/menu.dart';
import 'package:clima_comparador/models/relatorio_temperatura_sp_model.dart';

void main() async {

  imprimirMenu();

  List<DadoClimatico> todosOsDadosSP = [];
  List<DadoClimatico> todosOsDadosSC = [];


  for (int i = 1; i <= 12; i++) {
    final caminho = 'C:/CLIMA/SENSORES/SP_2024_$i.csv';
    todosOsDadosSP += await LeitorDados.carregarDados(caminho);
  }
  for (int i = 1; i <= 12; i++) {
    final caminho = 'C:/CLIMA/SENSORES/SC_2024_$i.csv';
    todosOsDadosSC += await LeitorDados.carregarDados(caminho);
  }


  final processador = ProcessarDadosTemp(todosOsDadosSP);
  final processadorSC = ProcessarDadosTemp(todosOsDadosSC);


  final relatorio = RelatorioTemperaturaModelSP(
    mediaAnual: processador.calcularMediaAnual(),
    maximaAnual: processador.calcularMaximaAnual(),
    minimaAnual: processador.calcularMinimaAnual(),
    mediasMensais: processador.calcularMediaMensal(),
    maximasMensais: processador.calcularMaximaMensal(),
    minimasMensais: processador.calcularMinimaMensal(),
    mediaHora: processador.calcularMediaPorHorario()
  );
  final relatorioSC = RelatorioTemperaturaModelSC(
      mediaAnual: processadorSC.calcularMediaAnual(),
      maximaAnual: processadorSC.calcularMaximaAnual(),
      minimaAnual: processadorSC.calcularMinimaAnual(),
      mediasMensais: processadorSC.calcularMediaMensal(),
      maximasMensais: processadorSC.calcularMaximaMensal(),
      minimasMensais: processadorSC.calcularMinimaMensal(),
      mediaHora: processadorSC.calcularMediaPorHorario()
  );

  final impressora = ImpressaoRelatorio(relatorio, relatorioSC);
  impressora.imprimirTudoTemp();

}
