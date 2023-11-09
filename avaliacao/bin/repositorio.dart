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
            '\nCódigo: ${pessoa.registro}\nNome: ${pessoa.nome}\nE-mail: ${pessoa.email}\nData de Nascimento: ${pessoa.nascimento}\nEndereço: ${pessoa.endereco}');
      }
    }
  }

  listarProfessores() {
    print('Professores:');
    for (Pessoa pessoa in cadastros) {
      if (pessoa is Professor) {
        print(
            '\nCódigo: ${pessoa.registro}\nNome: ${pessoa.nome}\nE-mail: ${pessoa.email}\nData de Nascimento: ${pessoa.nascimento}\nEndereço: ${pessoa.endereco}\nSalário: ${pessoa.salario}');
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

  excluirProfessor(String email, List<Pessoa> cadastros) {
    for (Pessoa cadastro in cadastros) {
      if (cadastro is Professor && cadastro.email == email) {
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
      print(
          '\nCurso: ${curso.nome}\nMáximo de alunos: ${curso.totalAlunos}\nAlunos Cadastrados${curso.pessoas.length}\n');
    }
  }

  excluirCurso(String nome, List<Curso> listaDeCursos) {
    for (Curso curso in listaDeCursos) {
      if (curso.pessoas.isEmpty && curso.nome == nome) {
        listaDeCursos.remove(curso);
        return print('Curso removido');
      } else if (curso.pessoas.isEmpty && curso.nome == nome) {
        return print(
            'O curso $nome tem ${curso.pessoas.length} pessoas cadastradas!\nUm curso não pode ser excluído com alunos cadastrados!');
      } else {
        return print('Curso inexistente.');
      }
    }
  }
}
