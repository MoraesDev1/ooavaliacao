import 'pessoa.dart';

class RegrasNegocio {
  bool autorizaRemover(List<Pessoa> cadastros, String email) {
    for (Pessoa cadastro in cadastros) {
      if (email == cadastro.email) {
        return true;
      }
    }
    return false;
  }
}
