// Modelo que representa os dados processados de temperatura para Santa Catarina
class RelatorioTemperaturaModelSC {
  final double mediaAnual;
  final double maximaAnual;
  final double minimaAnual;
  final List mediasMensais;
  final List maximasMensais;
  final List minimasMensais;
  final List mediaHora;
  // Construtor que exige todos os campos.
  RelatorioTemperaturaModelSC({
    required this.mediaAnual,
    required this.maximaAnual,
    required this.minimaAnual,
    required this.mediasMensais,
    required this.maximasMensais,
    required this.minimasMensais,
    required this.mediaHora,
  });
}
// Modelo de dados processados de umidade para Santa Catarina
class RelatorioUmidadeModelSC {
  final double mediaAnual;
  final double maximaAnual;
  final double minimaAnual;
  final List mediasMensais;
  final List maximasMensais;
  final List minimasMensais;
  // Construtor que exige todos os campos.
  RelatorioUmidadeModelSC({
    required this.mediaAnual,
    required this.maximaAnual,
    required this.minimaAnual,
    required this.mediasMensais,
    required this.maximasMensais,
    required this.minimasMensais,
  });
}

// Modelo de dados processados de direção do vento para Santa Catarina
class RelatorioDirecaoModelSC {
  final String maximaAnual;
  final List maximaMensal;

  // Construtor que exige todos os campos.
  RelatorioDirecaoModelSC({
    required this.maximaAnual,
    required this.maximaMensal,
  });
}

// Esta parte do código é responsável armazenas os dados tratados dos arquivos CSV em um model.