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

  factory Endereco.fromJson(Map<String, dynamic> json) {
    return Endereco(
      endereco: json['endereco'],
      bairro: json['bairro'],
      cidade: json['cidade'],
      uf: json['uf'],
      complemento: json['complemento'],
      pais: json['pais'],
      numero: json['numero'],
      cep: json['cep'],
    );
  }

  Map<String, dynamic> toJson() => {
        'endereco': this.endereco,
        'bairro': this.bairro,
        'cidade': this.cidade,
        'uf': this.uf,
        'complemento': this.complemento,
        'pais': this.pais,
        'numero': this.numero,
        'cep': this.cep,
      };

  Map toMap() {
    var map = new Map<String, dynamic>();

    map["endereco"] = this.endereco;
    map["bairro"] = this.bairro;
    map["cidade"] = this.cidade;
    map["uf"] = this.uf;
    map["complemento"] = this.complemento;
    map["pais"] = this.pais;
    map["numero"] = this.numero;
    map["cep"] = this.cep;

    return map;
  }

  String getDisplay() {
    String display =
        '${this.endereco}, ${this.numero}, ${this.bairro}, ${this.cidade}';
    return display;
  }
}
