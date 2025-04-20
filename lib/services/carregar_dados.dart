import 'package:clima_comparador/models/dados_climatico_model.dart';
import 'package:clima_comparador/services/leitura_dados.dart';

Future<List<DadoClimatico>> carregarDadosPorEstado(String estado) async {
  List<DadoClimatico> dados = [];
  List<String> arquivosInvalidos = [];


  for (int i = 1; i <= 12; i++) {
    final caminho = 'C:/CLIMA/SENSORES/${estado}_2024_$i.csv';

    try {
      final dadosMes = await LeitorDados.leituraDados(caminho);
      if (dadosMes.isEmpty) {
        arquivosInvalidos.add(caminho);
      } else {
        dados.addAll(dadosMes);
      }
    } catch (e) {
      arquivosInvalidos.add(caminho);
    }
  }

  if (arquivosInvalidos.isNotEmpty) {
    print("Aviso: ${arquivosInvalidos.length} arquivo(s) do estado $estado estão vazios ou com dados inválidos.");
  }

  if (dados.isEmpty) {
    print("Nenhum dado foi carregado para o estado $estado.\n");
  }

  return dados;
}

// Esta parte do código é responsável por carregar os dados dos arquivos CSV para serem enviados ao dados_climatico_model.dart.