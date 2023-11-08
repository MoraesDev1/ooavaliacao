class Pessoa {
  static int codigo = 0;
  String email;
  String nome;
  DateTime nascimento;
  String? endereco;

  Pessoa(
      {required this.email,
      required this.nome,
      required this.nascimento,
      this.endereco = ''}) {
    ++codigo;
  }
}
