import 'pessoa.dart';

class RegrasNegocio {
  bool autorizaCadastrar(List<Pessoa> cadastros, String email) {
    for (Pessoa pessoa in cadastros) {
      if (email == pessoa.email) {
        return false;
      }
    }
    return true;
  }

  bool cadastroExistente(List<Pessoa> cadastros, String email) {
    for (Pessoa cadastro in cadastros) {
      if (email == cadastro.email) {
        return true;
      }
    }
    return false;
  }

  exibeMedia(List<double> notas) {
    double media = 0;
    for (double i in notas) {
      media *= i;
    }
    return media / 3;
  }

  autorizaIncluirCurso() {}

  removeNotas() {}
}
