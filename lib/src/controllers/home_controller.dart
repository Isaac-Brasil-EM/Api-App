import 'package:api_fetch/src/repositories/aluno_repository.dart';
import 'package:flutter/cupertino.dart';
import '../models/aluno_model.dart';

class HomeController {
  List<AlunoModel> alunos = [];

  final AlunoRepository _alunoRepository;

  final state = ValueNotifier<HomeState>(HomeState.start);

  HomeController({alunoRepository})
      : _alunoRepository = alunoRepository ?? AlunoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      alunos = await _alunoRepository.fetchAlunos();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
