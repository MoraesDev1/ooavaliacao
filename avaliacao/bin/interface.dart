import 'dart:io';
import 'aluno.dart';
import 'curso.dart';
import 'nota_aluno.dart';
import 'pessoa.dart';
import 'professor.dart';
import 'regrasnegocio.dart';
import 'repositorio.dart';
import 'utils.dart';

class Interface {
  Repositorios repo = Repositorios();
  RegrasNegocio rn = RegrasNegocio();

  menuPrincipal() {
    String objEscolhido = '';
    while (objEscolhido != 'sair') {
      objEscolhido = exibeMenuPrincipal(objEscolhido);
      if (objEscolhido == '0') {
        break;
      }
      String acao = menuServicos();
      switch (objEscolhido) {
        case '1':
          switch (acao) {
            case '1':
              Aluno aluno = criarAluno();
              bool
                  autorizaCadastrar = //verificação de email deve ocorrer ao solicitar o email
                  rn.autorizaCadastrar(repo.cadastros, aluno.email);
              if (autorizaCadastrar) {
                repo.cadastrarPessoa(aluno);
                print('Aluno Cadastrado');
              } else {
                Pessoa.codigo--;
                print('E-mail informado já cadastrado');
              }
              break;
            case '2':
              String identificador = pedeIdentificador();
              if (rn.cadastroExistente(repo.cadastros, identificador)) {
                repo.alterarAluno(identificador);
                print('Alteração realizada');
              } else {
                print('Aluno não localizado');
              }
              break;
            case '3':
              String email = pedeIdentificador();
              bool autorizaRemover =
                  rn.cadastroExistente(repo.cadastros, email);
              if (autorizaRemover) {
                repo.excluirAluno(email);
                print('Aluno removido');
              } else {
                print('Aluno não localizado');
              }
              break;
            case '4':
              repo.listarAlunos();
              break;
            default:
              print('Opção inválida');
              break;
          }
          break;
        case '2':
          switch (acao) {
            case '1':
              Professor professor = criarProfessor();
              bool autorizaCadastrar =
                  rn.autorizaCadastrar(repo.cadastros, professor.email);

              if (autorizaCadastrar) {
                repo.cadastrarPessoa(professor);
                print('Professor cadastrado');
              } else {
                Pessoa.codigo--;
                print('E-mail informado já cadastrado');
              }
              break;
            case '2':
              String identificador = pedeIdentificador();
              if (rn.cadastroExistente(repo.cadastros, identificador)) {
                repo.alterarProfessor(identificador);
                print('Alteração realizada');
              } else {
                print('Professor não localizado');
              }
              break;
            case '3':
              String email = pedeIdentificador();
              bool autorizaRemover =
                  rn.cadastroExistente(repo.cadastros, email);
              if (autorizaRemover) {
                repo.excluirProfessor(email);
                print('Professor removido');
              } else {
                print('Professor não localizado');
              }
              break;
            case '4':
              repo.listarProfessores();
              break;
            default:
              print('Opção inválida');
              break;
          }
          break;
        case '3':
          switch (acao) {
            case '1':
              Curso curso = criarCurso();
              repo.cadastrarCurso(curso);
              print('Curso cadastrado');
              break;
            case '2':
              String nomeCurso = identificadorCurso();
              String alunoOuProfessor = menuAlunoOuProfessor();

              switch (alunoOuProfessor) {
                case '1':
                  String opAlteraCurso =
                      pedeAlteracaoCursoAluno(nomeCurso); //menualteracaoaluno
                  switch (opAlteraCurso) {
                    case '1':
                      //Inclusão de Aluno no curso
                      print('\nInforme o email do aluno a ser cadastrado:');
                      String email = stdin.readLineSync()!;
                      repo.incluirAlunoCurso(nomeCurso, email);
                    case '2':
                      //Remoção de Aluno do curso
                      print('\nInforme o email do aluno a ser removido:');
                      String email = stdin.readLineSync()!;
                      repo.removerPessoaCurso(nomeCurso, email);
                    case '3':
                      //Listar Alunos
                      repo.listarAlunosCurso(nomeCurso);
                    case '4':
                      print('\nInforme o email do aluno desejado');
                      String email = stdin.readLineSync()!;
                      String opcNota = gerenciarNotas();
                      switch (opcNota) {
                        case '1':
                          double nota = coletarNota();
                          repo.lancarNotas(nomeCurso, email, nota);
                        case '2':
                          repo.exibirNotas(nomeCurso, email);
                      }
                  }
                case '2':
                  String opAlteraCurso = pedeAlteracaoCursoProfessor(
                      nomeCurso); // menualteracaoprof
                  switch (opAlteraCurso) {
                    case '1':
                      //Inclusão de Professor no curso
                      print('\nInforme o email do Professor a ser cadastrado:');
                      String email = stdin.readLineSync()!;
                      repo.incluirProfessorCurso(nomeCurso, email);
                    case '2':
                      //Remoção de Professor do curso
                      print('\nInforme o email do Professor a ser removido:');
                      String email = stdin.readLineSync()!;
                      repo.removerPessoaCurso(nomeCurso, email);

                    case '3':
                      //Listar professores.
                      repo.listarProfessoresCurso(nomeCurso);
                  }
              }
              break;
            case '3':
              String nomeCurso = identificadorCurso();
              repo.excluirCurso(nomeCurso);
              break;
            case '4':
              repo.listarCursos();
              break;
            default:
              print('Opção inválida');
              break;
          }
          break;
        case '0':
          objEscolhido = 'sair';
          break;
        default:
          print('Opção inválida, tente novamente.');
      }
    }
  }

  String exibeMenuPrincipal(String objEscolhido) {
    print('''\nPara quem deseja realizar um serviço:
             1. Aluno
             2. Professor
             3. Curos
             0. Sair''');
    objEscolhido = stdin.readLineSync()!.toLowerCase();
    return objEscolhido;
  }

  String menuServicos() {
    print('''\nInforme o número da ação desejada: 
             1. Criar
             2. Alterar
             3. Excluir
             4. Listar''');
    String opcServicos = stdin.readLineSync()!;
    return opcServicos;
  }

  Aluno criarAluno() {
    String nomeAluno = '';
    String dataNascimentoStr = '';
    String email = '';
    String? endereco;
    int registro = Pessoa.codigo;
    List<NotaAluno> notas = [];

    print('\nInforme o e-mail: ');
    email = stdin.readLineSync()!;

    print('\nInforme o nome: ');
    nomeAluno = stdin.readLineSync()!;

    DateTime dataNascimentoDateTime = DateTime(0, 0, 0);
    while (dataNascimentoDateTime == DateTime(0, 0, 0)) {
      print('\nInforme o data de nascimento: ');
      dataNascimentoStr = stdin.readLineSync()!;
      dataNascimentoDateTime =
          Utils.converterStringParaDateTime(dataNascimentoStr);
    }
    print('\nInforme o endereço: ');
    endereco = stdin.readLineSync()!;
    Aluno aluno = Aluno(
        registro: registro,
        email: email,
        nome: nomeAluno,
        nascimento: dataNascimentoDateTime,
        endereco: endereco,
        notas: notas);
    return aluno;
  }

  Professor criarProfessor() {
    String nomeProfessor = '';
    String dataNascimentoStr = '';
    String email = '';
    String? endereco;
    int registro = Pessoa.codigo;

    print('\nInforme o e-mail: ');
    email = stdin.readLineSync()!;
    print('\nInforme o nome: ');
    nomeProfessor = stdin.readLineSync()!;

    DateTime dataNascimentoDateTime = DateTime(0, 0, 0);
    while (dataNascimentoDateTime == DateTime(0, 0, 0)) {
      print('\nInforme o data de nascimento: ');
      dataNascimentoStr = stdin.readLineSync()!;
      dataNascimentoDateTime =
          Utils.converterStringParaDateTime(dataNascimentoStr);
    }
    print('\nInforme o endereço: ');
    endereco = stdin.readLineSync()!;

    double salario = solicitaSalario();

    Professor professor = Professor(
        registro: registro,
        email: email,
        nome: nomeProfessor,
        nascimento: dataNascimentoDateTime,
        endereco: endereco,
        salario: salario);
    return professor;
  }

  double solicitaSalario() {
    print('\nInforme o salário do professor: ');
    double salario = double.parse(stdin.readLineSync()!);
    return salario;
  }

  String pedeIdentificador() {
    print('\nInforme o e-mail cadastrado:');
    String email = stdin.readLineSync()!;
    return email;
  }

  String identificadorCurso() {
    print('\nInforme o nome do curso:');
    String nome = stdin.readLineSync()!;
    return nome;
  }

  Curso criarCurso() {
    String nome = '';
    int totalAlunos = 0;
    List<Pessoa> alunosDoCurso = [];
    int idCurso = Curso.codigo;

    print('\nInforme o nome do curso: ');
    nome = stdin.readLineSync()!;
    print('\nInforme o total de alunos: ');
    totalAlunos = int.parse(stdin.readLineSync()!);

    Curso curso = Curso(
        nome: nome,
        totalAlunos: totalAlunos,
        idCurso: idCurso,
        pessoas: alunosDoCurso);
    return curso;
  }

  String pedeAlteracaoCursoAluno(String nomeCurso) {
    print(
        '\nQual alteração você deseja realizar no curso $nomeCurso?\n1 - Cadastrar\n2 - Remover\n3 - Listar\n4 - Lançar notas');
    String opAlteraCurso = stdin.readLineSync()!;
    return opAlteraCurso;
  }

  String pedeAlteracaoCursoProfessor(String nomeCurso) {
    print(
        '\nQual alteração você deseja realizar no curso $nomeCurso?\n1 - Cadastrar\n2 - Remover\n3 - Listar');
    String opAlteraCurso = stdin.readLineSync()!;
    return opAlteraCurso;
  }

  String informaPessoaRemoverCurso(bool id) {
    if (id == true) {
      print('\nInforme o email do aluno a ser removido:');
      String email = stdin.readLineSync()!;
      return email;
    } else {
      print('\nInforme o email do Professor a ser removido:');
      String email = stdin.readLineSync()!;
      return email;
    }
  }

  menuAlunoOuProfessor() {
    print('\nVocê deseja realizar está ação para:\n1 - Aluno\n2 - Professor');
    String alunoOuProfessor = stdin.readLineSync()!;
    return alunoOuProfessor;
  }

  String gerenciarNotas() {
    print('\nVocê deseja:\n1 - Lançar notas\n2 - Exibir notas');
    String opcNotas = stdin.readLineSync()!;
    return opcNotas;
  }

  double coletarNota() {
    print('Informe a nota do aluno:');
    double nota = double.parse(stdin.readLineSync()!);
    return nota;
  }
}
