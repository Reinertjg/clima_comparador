class DadoClimatico {
  // Atributos principais do nosso dado climático
  final int mes;
  final int dia;
  final int hora;
  final double temperatura;
  final double umidadeKG;
  final int direcaoVento;

  // Construtor da classe, todos os campos são obrigatórios
  DadoClimatico({
    required this.mes,
    required this.dia,
    required this.hora,
    required this.temperatura,
    required this.umidadeKG,
    required this.direcaoVento
  });

  // Metodo de fábrica que cria um DadoClimatico a partir de uma linha do CSV
  factory DadoClimatico.fromCsv(List<dynamic> linha) {
    return DadoClimatico(
      mes: int.tryParse(linha[0].toString()) ?? 0,
      dia: linha[1] is int ? linha[1] : 0,
      hora: linha[2] is int ? linha[2] : 0,
      temperatura: double.tryParse(linha[3].toString().replaceAll(',', '.')) ?? 0.0,
      umidadeKG: linha[4] is double ? linha[4] : 0.0,
      direcaoVento: linha[7] is int ? linha[7] : 0,
    );
  }
}

// Esta parte do código é responsável armazenas os dados dos arquivos CSV em um Model.