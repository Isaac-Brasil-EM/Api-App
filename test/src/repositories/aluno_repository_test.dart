import 'dart:convert';
import 'package:api_fetch/src/repositories/aluno_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final repository = AlunoRepository(dio);

  test('Deve trazer uma lista de AlunoModel', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: '/'), data: jsonDecode(jsonData)));
    final list = await repository.fetchAlunos();
    expect(list[1].nome, 'Isaac 102');
  });
}

String jsonData = '''
[
   {
      "matricula":1,
      "nome":"string",
      "cpf":"string",
      "nascimento":"2022-11-03T13:44:28.799",
      "sexo":0
   },
   {
      "matricula":2,
      "nome":"Isaac 102",
      "cpf":"15598678900",
      "nascimento":"2022-11-01T14:53:41.389",
      "sexo":0
   },
   {
      "matricula":3,
      "nome":"Isaac 103",
      "cpf":"15598678660",
      "nascimento":"2022-11-01T14:53:41.389",
      "sexo":0
   },
   {
      "matricula":4,
      "nome":"Isaac 104",
      "cpf":"15598448660",
      "nascimento":"2022-11-01T14:53:41.389",
      "sexo":0
   },
   {
      "matricula":5,
      "nome":"Isaac 105",
      "cpf":"15598455660",
      "nascimento":"2022-11-01T14:53:41.389",
      "sexo":0
   }
]
''';
