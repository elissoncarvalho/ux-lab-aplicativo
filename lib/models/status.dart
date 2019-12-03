class Status {
  String prefixo;
  String descricao;
  String corDestaque;

  Status({
    this.prefixo,
    this.descricao,
    this.corDestaque,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      prefixo: json['prefixo'],
      descricao: json['descricao'],
      corDestaque: json['cor_destaque'],
    );
  }
}
