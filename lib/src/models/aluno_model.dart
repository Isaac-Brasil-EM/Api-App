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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matricula'] = matricula;
    data['nome'] = nome;
    data['cpf'] = cpf;
    data['nascimento'] = nascimento;
    data['sexo'] = sexo;
    return data;
  }
}
