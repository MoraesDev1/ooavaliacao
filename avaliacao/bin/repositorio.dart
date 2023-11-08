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
}
