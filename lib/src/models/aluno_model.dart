class AlunoModel {
  int? matricula;
  String? nome;
  String? cpf;
  String? nascimento;
  int? sexo;

  AlunoModel({this.matricula, this.nome, this.cpf, this.nascimento, this.sexo});

  AlunoModel.fromJson(Map<String, dynamic> json) {
    matricula = json['matricula'];
    nome = json['nome'];
    cpf = json['cpf'];
    nascimento = json['nascimento'];
    sexo = json['sexo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matricula'] = this.matricula;
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    data['nascimento'] = this.nascimento;
    data['sexo'] = this.sexo;
    return data;
  }
}
