class Exame {
  int idExame;
  String prefixo;
  String descricao;
  String imagePath;
  bool isSelected;

  Exame({
    this.idExame,
    this.prefixo,
    this.descricao,
    this.imagePath,
    this.isSelected,
  });

  factory Exame.fromJson(Map<String, dynamic> json) {
    return Exame(
      idExame: json['id'],
      prefixo: json['prefixo'],
      descricao: json['descricao'],
      imagePath: json['image_path'],
      isSelected: json['is_selected'],
    );
  }
}
