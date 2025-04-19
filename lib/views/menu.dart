import 'dart:io';

void imprimirMenu() {
  print(
    "OLÁ, MARCELO. QUE RELATÓRIO VOCÊ PRECISA? \n"
        "1 – TEMPERATURA \n"
        "2 – UMIDADE \n"
        "3 – DIREÇÃO DO VENTO ",
  );
  stdout.write("DIGITE O NÚMERO DA OPÇÃO DESEJADA: ");
  var respostaUsuario = stdin.readLineSync();

  switch (respostaUsuario) {
    case "1":
      print("Relatorio de temperatura selecionado");
      break;
    case "2":
      print("Relatorio de umidade selecionado");
      break;
    case "3":
      print("Relatorio de direção do vento selecionado");
      break;
    default:
      print("Esta opcao nao existe");
      break;
  }
}