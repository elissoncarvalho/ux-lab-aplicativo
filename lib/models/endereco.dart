class Endereco {
  final String endereco;
  final String bairro;
  final String cidade;
  final String uf;
  final String complemento;
  final String pais;
  final int numero;
  final int cep;

  Endereco({
    this.endereco,
    this.bairro,
    this.cidade,
    this.uf,
    this.complemento,
    this.pais,
    this.numero,
    this.cep,
  });

  String getDisplay() {
    String display =
        '${this.endereco}, ${this.numero}, ${this.bairro}, ${this.cidade}';
    return display;
  }
}
