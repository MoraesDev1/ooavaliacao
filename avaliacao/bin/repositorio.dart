import 'dart:io';
import 'aluno.dart';
import 'curso.dart';
import 'nota_aluno.dart';
import 'pessoa.dart';
import 'professor.dart';
import 'utils.dart';

class Repositorios {
  List<Pessoa> cadastros = [];
  List<Curso> listaDeCursos = [];

  cadastrarPessoa(Pessoa pessoa) {
    cadastros.add(pessoa);
    print('Cadastro realizado');
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
      if (cadastro is Aluno &&
          cadastro.email == email &&
          cadastro.notas.isEmpty) {
        cadastros.remove(cadastro);
        print('Aluno removido');
        break;
      }
    }
  }

  excluirProfessor(String email) {
    for (Pessoa cadastro in cadastros) {
      if (cadastro is Professor && cadastro.email == email) {
        cadastros.remove(cadastro);
        print('Professor removido');
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
          '\nCurso: ${curso.nome}\nMáximo de alunos: ${curso.totalAlunos}\nAlunos Cadastrados: ${curso.pessoas.length}\n');
    }
  }

  cursoExistente(String nomeCurso) {
    for (Curso curso in listaDeCursos) {
      if (curso.nome == nomeCurso) {
        return true;
      }
    }
    return false;
  }

  excluirCurso(String nome) {
    for (Curso curso in listaDeCursos) {
      if (curso.pessoas.isEmpty && curso.nome == nome) {
        listaDeCursos.remove(curso);
        print('\nCurso removido');
        break;
      } else if (curso.pessoas.isNotEmpty && curso.nome == nome) {
        print(
            '\nO curso $nome tem ${curso.pessoas.length} pessoas cadastradas!\nUm curso não pode ser excluído com alunos cadastrados!');
        break;
      } else if (listaDeCursos.contains(curso)) {
        return false;
      }
    }
  }

  bool verificaSeAlunoEstaCadastradoNoCurso(Curso curso, Aluno aluno) {
    List<Aluno> alunosDoCurso = curso.pessoas.whereType<Aluno>().toList();
    if (alunosDoCurso.contains(aluno)) {
      return true;
    }
    return false;
  }

  incluirAlunoCurso(Curso curso, Aluno aluno) {
    List<Aluno> alunosDoCurso = curso.pessoas.whereType<Aluno>().toList();
    if (curso.totalAlunos > alunosDoCurso.length) {
      curso.pessoas.add(aluno);
      aluno.notas.add(NotaAluno(notas: <double>[], curso: curso));
      print('\nAluno cadastrado');
    } else {
      print('Limite de alunos atingido para o Curso');
    }
  }

  buscaPessoaEmCadastros(String email) {
    for (Pessoa pessoa in cadastros) {
      if (email == pessoa.email) {
        return pessoa;
      }
    }
  }

  buscaCursoEmListaDeCursos(String nomeCurso) {
    for (Curso curso in listaDeCursos) {
      if (nomeCurso == curso.nome) {
        return curso;
      }
    }
  }

  incluirProfessorCurso(Curso curso, Professor professor) {
    curso.pessoas.add(professor);
    print('\nProfessor cadastrado');
  }

  removerPessoaCurso(String nomeCurso, String email) {
    for (Curso curso in listaDeCursos) {
      if (curso.nome == nomeCurso) {
        for (Pessoa pessoa in curso.pessoas) {
          if (pessoa.email == email && pessoa is Aluno) {
            curso.pessoas.remove(pessoa);
            return print('Aluno removido');
          } else if (pessoa.email == email && pessoa is Professor) {
            curso.pessoas.remove(pessoa);
            return print('Professor removido');
          } else {
            return print('E-mail não localizado para este curso');
          }
        }
      }
    }
  }

  listarAlunosCurso(String nomeCurso) {
    for (Curso curso in listaDeCursos) {
      if (curso.nome == nomeCurso) {
        print('\nAlunos cadastrados no curso de $nomeCurso:\n');
        for (Pessoa pessoa in curso.pessoas) {
          if (pessoa is Aluno) {
            print('Nome: ${pessoa.nome}');
          }
        }
      } else {
        return print('Curso não localizado');
      }
    }
  }

  listarProfessoresCurso(String nomeCurso) {
    for (Curso curso in listaDeCursos) {
      if (curso.nome == nomeCurso) {
        Iterable<Professor> professoresDoCurso =
            curso.pessoas.whereType<Professor>();
        for (Professor professor in professoresDoCurso) {
          print('Nome: ${professor.nome}');
        }
      } else {
        print('Curso não localizado');
      }
    }
  }

  lancarNotas(String nomeCurso, String email, double nota) {
    for (Pessoa pessoa in cadastros) {
      if (pessoa.email == email && pessoa is Aluno) {
        for (Curso curso in listaDeCursos) {
          if (curso.nome == nomeCurso && curso.pessoas.contains(pessoa)) {
            pessoa.notas.forEach(
              (element) {
                if (element.notas.length <= 3) {
                  element.notas.add(nota);
                  print('Nota lançada com sucesso');
                } else {
                  print(
                      'Não foi possível lançar a nota pois todas as notas já foram lançadas');
                }
              },
            );
          }
        }
      }
    }
  }

  exibirNotas(String nomeCurso, String email) {
    for (Pessoa pessoa in cadastros) {
      if (pessoa.email == email && pessoa is Aluno) {
        for (Curso curso in listaDeCursos) {
          if (curso.nome == nomeCurso && curso.pessoas.contains(pessoa)) {
            pessoa.notas.forEach(
              (element) {
                if (element.curso.nome == nomeCurso) {
                  print(
                      '\nNota 1: ${element.notas[0]}\nNota 2: ${element.notas[1]}\nNota 3: ${element.notas[2]}');
                }
              },
            );
          }
        }
      }
    }
  }
}
