import 'dart:io';

import 'pessoa.dart';

class Interface {
  menuPrincipal() {
    String objEscolhido = '';
    while (objEscolhido != 'sair') {
      objEscolhido = exibeMenuPrincipal(objEscolhido);
      String acao = menuServicos();
      switch (objEscolhido) {
        case '1':
          switch (acao) {
            case '1':
              criaPessoa();
              print();
              // criarAluno();
              break;

            case '2':
              // alterarAluno();
              break;

            case '3':
              // excluirAluno();
              break;

            case '4':
              // listarAlunos();
              break;
            default:
              print('Opção inválida');
              break;
          }
          break;
        case '2':
          switch (acao) {
            case '1':
              // criarProfessor();
              break;

            case '2':
              // alterarProfessor();
              break;

            case '3':
              // excluirProfessor();
              break;

            case '4':
              // listarProfessores();
              break;
            default:
              print('Opção inválida');
              break;
          }
          break;
        case '3':
          switch (acao) {
            case '1':
              // criarCurso();
              break;

            case '2':
              // alterarCurso();
              break;

            case '3':
              // excluirCurso();
              break;

            case '4':
              // listarCurso();
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
    print('''Para quem deseja realizar um serviço:
             1. Aluno
             2. Professor
             3. Curos
             0. Sair''');
    objEscolhido = stdin.readLineSync()!.toLowerCase();
    return objEscolhido;
  }

  String menuServicos() {
    print('''Informe o número da ação desejada: 
             1. Criar
             2. Alterar
             3. Excluir
             4. Listar''');
    String opcServicos = stdin.readLineSync()!;
    return opcServicos;
  }

  Pessoa criaPessoa() {
    String nomePessoa = '';
    String dataNascimentoStr = '';
    String email = '';
    String? endereco;
    print('Informe o e-mail: ');
    email = stdin.readLineSync()!;
    print('Informe o nome: ');
    nomePessoa = stdin.readLineSync()!;

    print('Informe o data de nascimento: ');
    dataNascimentoStr = stdin.readLineSync()!;
    List<String> diaMesAno = dataNascimentoStr.trim().split('/');
    int ano = int.tryParse(diaMesAno[2])!;
    int mes = int.tryParse(diaMesAno[1])!;
    int dia = int.tryParse(diaMesAno[0])!;
    DateTime(ano,)

    print('Informe o endereço: ');
    endereco = stdin.readLineSync()!;
    Pessoa pessoa = Pessoa(
        email: email,
        nome: nomePessoa,
        nascimento: dataNascimentoStr,
        endereco: endereco);
    return pessoa;
  }

  double solicitaSalario() {
    print('Informe o salário do professor: ');
    double salario = double.parse(stdin.readLineSync()!);
    return salario;
  }

  gerenciaCurso() {
    print('''Informe o número da ação desejada: 
             1. Incluir
             2. Excluir
             3. Listar''');
    String opcaoGerenciaCursos = stdin.readLineSync()!;
  }

//incluir aluno ou professor?

  gerenciaNotas() {
    print('''Informe o número da ação desejada: 
             1. Incluir
             2. Alterar
             3. Excluir
             4. Exibir média aritimética''');
    String opcaoGerenciaNotas = stdin.readLineSync()!;
  }
}
