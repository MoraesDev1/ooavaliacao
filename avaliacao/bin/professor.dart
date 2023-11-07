import 'pessoa.dart';

class Professor extends Pessoa {
  double salario;

  Professor({
    required super.email,
    required super.nome,
    required super.nascimento,
    required this.salario,
  }) {
    ++Pessoa.codigo;
  }
}
