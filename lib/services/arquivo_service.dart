import 'dart:io';

class ArquivoService {
  // Função para criar e adicionar conteúdo ao arquivo
  static Future<void> criarESalvarArquivo(String caminhoArquivo, String conteudo) async {
    try {

      // Criação do arquivo e escrita de conteúdo
      File arquivo = File("C:/clima/$caminhoArquivo");

      // Escreve o conteúdo no arquivo (cria o arquivo se não existir)
      await arquivo.writeAsString(conteudo);

      print('Arquivo criado sucesso em: $caminhoArquivo');
      print('Local: C:/clima/$caminhoArquivo');
    } catch (e) {
      print('Erro ao criar o arquivo: $e');
    }
  }
}

