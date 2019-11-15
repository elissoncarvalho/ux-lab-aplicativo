class Endereco {
  String endereco;
  String bairro;
  String cidade;
  String uf;
  String complemento;
  String pais;
  int numero;
  int cep;

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
