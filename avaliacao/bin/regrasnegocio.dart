import 'aluno.dart';
import 'curso.dart';
import 'nota_aluno.dart';
import 'pessoa.dart';
import 'professor.dart';

class RegrasNegocio {
  criarAluno(
    String nome,
    String email,
    DateTime nascimento,
    String endereco,
    List<NotaAluno> notas,
  ) {
    Pessoa aluno =
        Aluno(email: email, nome: nome, nascimento: nascimento, notas: notas);
    return aluno;
  }

  alterarAluno(String email) {}

  excluirAluno(String email) {}

  listarAluno() {}

  criarProfessor(
    String nome,
    String email,
    DateTime nascimento,
    String endereco,
    double salario,
  ) {
    Pessoa professor = Professor(
        email: email, nome: nome, nascimento: nascimento, salario: salario);
    return professor;
  }

  alterarProfessor(String email) {}

  excluirProfessor(String email) {}

  listarProfessor() {}

  criarCurso(String nome, int totalAlunos) {
    Curso curso = Curso(nome: nome, totalAlunos: totalAlunos);
    return curso;
  }

  alterarCurso() {}

  excluirCurso() {}

  listarCurso() {}
}
