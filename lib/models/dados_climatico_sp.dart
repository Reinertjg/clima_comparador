class DadoClimatico {
  final int mes;
  final int dia;
  final int hora;
  final double temperatura;
  final double umidadeKG;
  final int direcaoVento;

  DadoClimatico({
    required this.mes,
    required this.dia,
    required this.hora,
    required this.temperatura,
    required this.umidadeKG,
    required this.direcaoVento
  });

  factory DadoClimatico.fromCsv(List<dynamic> linha) {
    return DadoClimatico(
      mes: int.tryParse(linha[0].toString()) ?? 0,
      dia: linha[1],
      hora: linha[2],
      temperatura: double.tryParse(linha[3].toString().replaceAll(',', '.')) ?? 0.0,
      umidadeKG: linha[4],
      direcaoVento: linha[7]
    );
  }
}
