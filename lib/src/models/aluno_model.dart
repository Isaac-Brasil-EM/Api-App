class AlunoModel {
  late int matricula;
  late String nome;
  late String cpf;
  late String nascimento;
  late int sexo;

  AlunoModel({matricula, nome, cpf, nascimento, sexo});

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
