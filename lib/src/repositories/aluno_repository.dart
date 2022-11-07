import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/aluno_model.dart';

class AlunoRepository {
  late Dio dio;
  final String url = 'https://localhost:7223/api/Aluno';

  AlunoRepository([Dio? client]) {
    dio = client ?? Dio();
  }

  Future<List<AlunoModel>> fetchAlunos() async {
    final response = await dio.get(url);
    final list = response.data as List;

    return list.map((json) => AlunoModel.fromJson(json)).toList();
  }
}
