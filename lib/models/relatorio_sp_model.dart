class RelatorioTemperaturaModelSP {
  final double mediaAnual;
  final double maximaAnual;
  final double minimaAnual;
  final List mediasMensais;
  final List maximasMensais;
  final List minimasMensais;
  final List mediaHora;

  RelatorioTemperaturaModelSP({
    required this.mediaAnual,
    required this.maximaAnual,
    required this.minimaAnual,
    required this.mediasMensais,
    required this.maximasMensais,
    required this.minimasMensais,
    required this.mediaHora,
  });
}

class RelatorioUmidadeModelSP {
  final double mediaAnual;
  final double maximaAnual;
  final double minimaAnual;
  final List mediasMensais;
  final List maximasMensais;
  final List minimasMensais;

  RelatorioUmidadeModelSP({
    required this.mediaAnual,
    required this.maximaAnual,
    required this.minimaAnual,
    required this.mediasMensais,
    required this.maximasMensais,
    required this.minimasMensais,
  });
}