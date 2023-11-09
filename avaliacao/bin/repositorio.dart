import 'aluno.dart';
import 'curso.dart';
import 'pessoa.dart';
import 'professor.dart';

class Repositorios {
  List<Pessoa> cadastros = [];
  List<Curso> listaDeCursos = [];

  cadastrarPessoa(Pessoa pessoa) {
    cadastros.add(pessoa);
  }

  listarAlunos() {
    print('Alunos:');
    for (Pessoa pessoa in cadastros) {
      if (pessoa is Aluno) {
        print(
            '\nNome: ${pessoa.nome}\nE-mail: ${pessoa.email}\nData de Nascimento: ${pessoa.nascimento}\nEndereço: ${pessoa.endereco}');
      }
    }
  }

  listarProfessores() {
    print('Professores:');
    for (Pessoa pessoa in cadastros) {
      if (pessoa is Professor) {
        print(
            '\nNome: ${pessoa.nome}\nE-mail: ${pessoa.email}\nData de Nascimento: ${pessoa.nascimento}\nEndereço: ${pessoa.endereco}\nSalário: ${pessoa.salario}');
      }
    }
  }

  excluirAluno(String email, List<Pessoa> cadastros) {
    for (Pessoa cadastro in cadastros) {
      if (cadastro is Aluno && cadastro.email == email) {
        cadastros.remove(cadastro);
        break;
      }
    }
  }

  cadastrarCurso(Curso curso) {
    listaDeCursos.add(curso);
  }

  listarCursos() {
    print('Cursos:');
    for (Curso curso in listaDeCursos) {
      print('\nCurso: ${curso.nome}\nTotal de alunos: ${curso.totalAlunos}');
    }
  }

  excluirCurso(String nome, List<Curso> cursos) {
    for (Curso curso in cursos) {
      if (curso.pessoas.length < 1 && curso.nome == nome) {
        cursos.remove(curso);
        return print('Curso removido com sucesso');
      } else if (curso.pessoas.length > 0) {
        return print('Um curso não pode ser excluído com alunos cadastrados.');
      } else {
        return print('Curso inexistente.');
      }
    }
  }
}
