// lib/services/gerar_relatorios.dart
import 'package:clima_comparador/models/relatorio_sp_model.dart';
import 'package:clima_comparador/models/relatorio_sc_model.dart';
import 'package:clima_comparador/services/relatorio_direcao_vento.dart';
import 'package:clima_comparador/services/relatorio_temperatura.dart';
import 'package:clima_comparador/services/relatorio_umidade.dart';
import 'package:clima_comparador/views/impressao_relatorio.dart';

import '../models/dados_climatico_model.dart';

// Função para gerar os relatórios de temperatura para os dados de São Paulo e Santa Catarina
void gerarRelatorios(List<DadoClimatico> dadosSP, List<DadoClimatico> dadosSC) {
  try {
    final processadorTempSP = ProcessarDadosTemp(dadosSP);
    final processadorTempSC = ProcessarDadosTemp(dadosSC);

    // Relatórios de Temperatura
    final relatorioSP = RelatorioTemperaturaModelSP(
      mediaAnual: processadorTempSP.calcularMediaAnual(),
      maximaAnual: processadorTempSP.calcularMaximaAnual(),
      minimaAnual: processadorTempSP.calcularMinimaAnual(),
      mediasMensais: processadorTempSP.calcularMediaMensal(),
      maximasMensais: processadorTempSP.calcularMaximaMensal(),
      minimasMensais: processadorTempSP.calcularMinimaMensal(),
      mediaHora: processadorTempSP.calcularMediaPorHorario(),
    );
    final relatorioSC = RelatorioTemperaturaModelSC(
      mediaAnual: processadorTempSC.calcularMediaAnual(),
      maximaAnual: processadorTempSC.calcularMaximaAnual(),
      minimaAnual: processadorTempSC.calcularMinimaAnual(),
      mediasMensais: processadorTempSC.calcularMediaMensal(),
      maximasMensais: processadorTempSC.calcularMaximaMensal(),
      minimasMensais: processadorTempSC.calcularMinimaMensal(),
      mediaHora: processadorTempSC.calcularMediaPorHorario(),
    );

    // Impressões dos Relatórios
    final impressoraTemp = ImpressaoRelatorioTemp(relatorioSP, relatorioSC);
    impressoraTemp.imprimirTudoTemp();
  } catch (e) {
    print('Erro ao gerar relatórios de temperatura: $e');
  }
}

// Função para gerar os relatórios de umidade para os dados de São Paulo e Santa Catarina
void gerarRelatoriosUmidade(List<DadoClimatico> dadosSP, List<DadoClimatico> dadosSC,) {
  try {
    final processadorUmiSP = ProcessarDadosUmi(dadosSP);
    final processadorUmiSC = ProcessarDadosUmi(dadosSC);
    // Relatórios de Umidade
    final relatorioUmiSP = RelatorioUmidadeModelSP(
      mediaAnual: processadorUmiSP.calcularMediaAnual(),
      maximaAnual: processadorUmiSP.calcularMaximaAnual(),
      minimaAnual: processadorUmiSP.calcularMinimaAnual(),
      mediasMensais: processadorUmiSP.calcularMediaMensal(),
      maximasMensais: processadorUmiSP.calcularMaximaMensal(),
      minimasMensais: processadorUmiSP.calcularMinimaMensal(),
    );
    final relatorioUmiSC = RelatorioUmidadeModelSC(
      mediaAnual: processadorUmiSC.calcularMediaAnual(),
      maximaAnual: processadorUmiSC.calcularMaximaAnual(),
      minimaAnual: processadorUmiSC.calcularMinimaAnual(),
      mediasMensais: processadorUmiSC.calcularMediaMensal(),
      maximasMensais: processadorUmiSC.calcularMaximaMensal(),
      minimasMensais: processadorUmiSC.calcularMinimaMensal(),
    );

    // Impressões dos Relatórios
    final impressoraUmi = ImpressaoRelatorioUmi(relatorioUmiSP, relatorioUmiSC);
    impressoraUmi.imprimirTudo();
  } catch (e) {
    print('Erro ao gerar relatórios de Umidade do Ar: $e');
  }
}

// Função para gerar os relatórios de direção do vento para os dados de São Paulo e Santa Catarina
void gerarRelatoriosDirecao(List<DadoClimatico> dadosSP, List<DadoClimatico> dadosSC,) {
  try {
    final processadorDirSP = ProcessarDadosDir(dadosSP);
    final processadorDirSC = ProcessarDadosDir(dadosSC);
    // Relatórios de Umidade
    final relatorioDirSP = RelatorioDirecaoModelSP(
      maximaAnual: processadorDirSP.calcularMaiorFrequenteAnual(),
      maximaMensal: processadorDirSP.calcularMaiorFrequenciaMensal(),
    );
    final relatorioDirSC = RelatorioDirecaoModelSC(
      maximaAnual: processadorDirSC.calcularMaiorFrequenteAnual(),
      maximaMensal: processadorDirSC.calcularMaiorFrequenciaMensal(),
    );

    // Impressões dos Relatórios
    final impressoraDir = ImpressaoRelatorioDir(relatorioDirSP, relatorioDirSC);
    impressoraDir.imprimirTudo();
  } catch (e) {
    print('Erro ao gerar relatórios de Direção do Vento: $e');
  }
}
