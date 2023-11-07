import 'pessoa.dart';

class Curso {
  static int codigo = 0;
  String nome;
  int totalAlunos;
  List<Pessoa> pessoas = [];

  Curso({required this.nome, required this.totalAlunos}) {
    ++codigo;
  }
}
