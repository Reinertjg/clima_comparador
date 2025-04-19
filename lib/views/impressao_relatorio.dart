import 'package:yaansi/yaansi.dart';

class ImpressaoRelatorio {
  void imprimirMediaMensal(List media) {
    print(">> TEMPERATURA MÉDIA MENSAL (SP)");
    for(int i =0; i<12; i++) {
      print("   MÊS ${i+1}: ${media[i]} °C");
    }
  }

}
