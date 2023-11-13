import 'dart:io';

import 'aluno.dart';
import 'curso.dart';
import 'pessoa.dart';
import 'professor.dart';
import 'utils.dart';

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
        String dataNasimentoString =
            Utils.converterDateTimeParaString(pessoa.nascimento);
        print(
            '\nCódigo: ${pessoa.registro}\nNome: ${pessoa.nome}\nE-mail: ${pessoa.email}\nData de Nascimento: $dataNasimentoString\nEndereço: ${pessoa.endereco}');
      }
    }
  }

  listarProfessores() {
    print('Professores:');
    for (Pessoa pessoa in cadastros) {
      if (pessoa is Professor) {
        String dataNasimentoString =
            Utils.converterDateTimeParaString(pessoa.nascimento);
        print(
            '\nCódigo: ${pessoa.registro}\nNome: ${pessoa.nome}\nE-mail: ${pessoa.email}\nData de Nascimento: $dataNasimentoString\nEndereço: ${pessoa.endereco}\nSalário: ${pessoa.salario}');
      }
    }
  }

  excluirAluno(String email) {
    for (Pessoa cadastro in cadastros) {
      if (cadastro is Aluno && cadastro.email == email) {
        cadastros.remove(cadastro);
        break;
      }
    }
  }

  excluirProfessor(String email) {
    for (Pessoa cadastro in cadastros) {
      if (cadastro is Professor && cadastro.email == email) {
        cadastros.remove(cadastro);
        break;
      }
    }
  }

  alterarAluno(String identificador) {
    for (Pessoa pessoa in cadastros) {
      if (identificador == pessoa.email) {
        print(
            '\nQual informação deseja alterar?\n\n1 - Nome\n2 - Data de Nascimento\n3 - Endereço');
        String alteracaoAluno = stdin.readLineSync()!;
        String novaInformacao = '';
        switch (alteracaoAluno) {
          case '1':
            print('Digite o novo Nome:');
            novaInformacao = stdin.readLineSync()!;
            pessoa.nome = novaInformacao;
          case '2':
            print('Digite a nova Data de Nascimento:');
            novaInformacao = stdin.readLineSync()!;
            DateTime novaData =
                Utils.converterStringParaDateTime(novaInformacao);
            pessoa.nascimento = novaData;
          case '3':
            print('Digite o novo Endereço:');
            novaInformacao = stdin.readLineSync()!;
            pessoa.endereco = novaInformacao;
          default:
            print('Açao inválida');
        }
      }
    }
  }

  alterarProfessor(String identificador) {
    for (Pessoa pessoa in cadastros) {
      if (identificador == pessoa.email) {
        print(
            '\nQual informação deseja alterar?\n\n1 - Nome\n2 - Data de Nascimento\n3 - Endereço');
        String alteracaoAluno = stdin.readLineSync()!;
        String novaInformacao = '';
        switch (alteracaoAluno) {
          case '1':
            print('Digite o novo Nome:');
            novaInformacao = stdin.readLineSync()!;
            pessoa.nome = novaInformacao;
          case '2':
            print('Digite a nova Data de Nascimento:');
            novaInformacao = stdin.readLineSync()!;
            DateTime novaData =
                Utils.converterStringParaDateTime(novaInformacao);
            pessoa.nascimento = novaData;
          case '3':
            print('Digite o novo Endereço:');
            novaInformacao = stdin.readLineSync()!;
            pessoa.endereco = novaInformacao;
          default:
            print('Açao inválida');
        }
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

  excluirCurso(String nome) {
    for (Curso curso in listaDeCursos) {
      if (curso.pessoas.isEmpty && curso.nome == nome) {
        listaDeCursos.remove(curso);
        return print('Curso removido');
      } else if (curso.pessoas.isNotEmpty && curso.nome == nome) {
        return print(
            'O curso $nome tem ${curso.pessoas.length} pessoas cadastradas!\nUm curso não pode ser excluído com alunos cadastrados!');
      } else {
        return print('Curso inexistente.');
      }
    }
  }

  incluirPessoaCurso(String nomeCurso, String email) {
    for (Pessoa pessoa in cadastros) {
      if (pessoa.email == email && pessoa is Aluno) {
        for (Curso i in listaDeCursos) {
          if (i == nomeCurso) {
            i.pessoas.add(pessoa);
            return print('Aluno cadastrado.');
          }
        }
      } else if (pessoa.email == email && pessoa is Professor) {
        for (Curso i in listaDeCursos) {
          if (i == nomeCurso) {
            i.pessoas.add(pessoa);
            return print('Professor cadastrado.');
          }
        }
      }
    }
  }

  removerPessoaCurso(String nomeCurso, String email) {
    for (Pessoa pessoa in cadastros) {
      if (pessoa.email == email && pessoa is Aluno) {
        for (Curso i in listaDeCursos) {
          if (i == nomeCurso) {
            i.pessoas.remove(pessoa);
            return print('Aluno removido.');
          }
        }
      } else if (pessoa.email == email && pessoa is Professor) {
        for (Curso i in listaDeCursos) {
          if (i == nomeCurso) {
            i.pessoas.remove(pessoa);
            return print('Professor removido.');
          }
        }
      }
    }
  }

  listarPessoaCurso(String nomeCurso, String pessoa) {
    for (Curso curso in listaDeCursos) {
      if (curso == nomeCurso) {
        for (Pessoa i in curso.pessoas) {
          if (i is Aluno && pessoa == '1') {
            print(i);
          } else if (i is Professor && pessoa == '2') {
            print(i);
          }
        }
      }
    }
  }
}
