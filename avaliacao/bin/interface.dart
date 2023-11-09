import 'dart:io';
import 'aluno.dart';
import 'curso.dart';
import 'nota_aluno.dart';
import 'professor.dart';
import 'regrasnegocio.dart';
import 'repositorio.dart';

class Interface {
  Repositorios repo = Repositorios();
  RegrasNegocio rn = RegrasNegocio();
  menuPrincipal() {
    String objEscolhido = '';
    while (objEscolhido != 'sair') {
      objEscolhido = exibeMenuPrincipal(objEscolhido);
      String acao = menuServicos();
      switch (objEscolhido) {
        case '1':
          switch (acao) {
            case '1':
              Aluno aluno = criarAluno();
              repo.cadastrarPessoa(aluno);
              print('Aluno cadastrado');
              break;

            case '2':
              // alterarAluno();
              break;

            case '3':
              String email = pedeIdentificador();
              if (rn.autorizaRemover(repo.cadastros, email)) {
                repo.excluirAluno(email, repo.cadastros);
                print('Cadastro removido');
              } else {
                print('Cadastro não localizado');
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
              repo.cadastrarPessoa(professor);
              print('Professor cadastrado');
              break;
            case '2':
              // alterarProfessor();
              break;

            case '3':
              // excluirProfessor();
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
              // alterarCurso();
              break;

            case '3':
              String nome = identificadorCurso();
              repo.excluirCurso(nome, repo.listaDeCursos);
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
    List<NotaAluno> notas = [];

    print('Informe o e-mail: ');
    email = stdin.readLineSync()!;
    print('Informe o nome: ');
    nomeAluno = stdin.readLineSync()!;

    print('Informe o data de nascimento: Ex: 99/99/9999');
    dataNascimentoStr = stdin.readLineSync()!;
    List<String> diaMesAno = dataNascimentoStr.trim().split('/');
    int ano = int.tryParse(diaMesAno[2])!;
    int mes = int.tryParse(diaMesAno[1])!;
    int dia = int.tryParse(diaMesAno[0])!;
    DateTime dataNascimento = DateTime(ano, mes, dia);

    print('Informe o endereço: ');
    endereco = stdin.readLineSync()!;
    Aluno aluno = Aluno(
        email: email,
        nome: nomeAluno,
        nascimento: dataNascimento,
        endereco: endereco,
        notas: notas);
    return aluno;
  }

  Professor criarProfessor() {
    String nomeProfessor = '';
    String dataNascimentoStr = '';
    String email = '';
    String? endereco;

    print('Informe o e-mail: ');
    email = stdin.readLineSync()!;
    print('Informe o nome: ');
    nomeProfessor = stdin.readLineSync()!;

    print('Informe o data de nascimento: ');
    dataNascimentoStr = stdin.readLineSync()!;
    List<String> diaMesAno = dataNascimentoStr.trim().split('/');
    int ano = int.tryParse(diaMesAno[2])!;
    int mes = int.tryParse(diaMesAno[1])!;
    int dia = int.tryParse(diaMesAno[0])!;
    DateTime dataNascimento = DateTime(ano, mes, dia);

    double salario = solicitaSalario();

    print('Informe o endereço: ');
    endereco = stdin.readLineSync()!;

    Professor professor = Professor(
        email: email,
        nome: nomeProfessor,
        nascimento: dataNascimento,
        endereco: endereco,
        salario: salario);
    return professor;
  }

  double solicitaSalario() {
    print('Informe o salário do professor: ');
    double salario = double.parse(stdin.readLineSync()!);
    return salario;
  }

  String pedeIdentificador() {
    print('Informe o e-mail cadastrado:');
    String email = stdin.readLineSync()!;
    return email;
  }

  String identificadorCurso() {
    print('Informe o nome do curso:');
    String nome = stdin.readLineSync()!;
    return nome;
  }

//   gerenciaCurso() {
//     print('''Informe o número da ação desejada:
//              1. Incluir
//              2. Excluir
//              3. Listar''');
//     String opcaoGerenciaCursos = stdin.readLineSync()!;
//   }

// //incluir aluno ou professor?

//   gerenciaNotas() {
//     print('''Informe o número da ação desejada:
//              1. Incluir
//              2. Alterar
//              3. Excluir
//              4. Exibir média aritimética''');
//     String opcaoGerenciaNotas = stdin.readLineSync()!;
//   }
  Curso criarCurso() {
    String nome = '';
    int totalAlunos = 0;

    print('Informe o nome do curso: ');
    nome = stdin.readLineSync()!;
    print('Informe o total de alunos: ');
    totalAlunos = int.parse(stdin.readLineSync()!);

    Curso curso = Curso(nome: nome, totalAlunos: totalAlunos);
    return curso;
  }
}
