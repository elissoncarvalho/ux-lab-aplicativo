class Convenio {
  String nome;
  String cnpj;

  Convenio({
    this.nome,
    this.cnpj
  });

  factory Convenio.fromJson(Map<String, dynamic> json) {
    return Convenio(
      nome: json['nome_razao_social'],
      cnpj: json['cnpj'],
    );
  }
}
