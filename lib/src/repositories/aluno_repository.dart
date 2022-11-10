import 'dart:convert';
import 'package:api_fetch/src/models/aluno_model.dart';
import 'package:api_fetch/src/models/todo_model.dart';
import 'package:dio/dio.dart';

class AlunoRepository {
  late Dio dio;
  final String url = 'https://192.168.1.219:448/api/aluno/';
  final String url2 = 'https://jsonplaceholder.typicode.com/todos';

  AlunoRepository([Dio? client]) {
    dio = client ?? Dio();
  }

  Future<List<AlunoModel>> fetchAlunos() async {
    final response = await dio.get(url);
    final list = response.data as List;

    return list.map((json) => AlunoModel.fromJson(json)).toList();
  }
}
