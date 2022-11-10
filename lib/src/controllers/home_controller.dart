import 'package:api_fetch/src/models/todo_model.dart';
import 'package:api_fetch/src/repositories/aluno_repository.dart';
import 'package:api_fetch/src/repositories/todo_repository.dart';
import 'package:flutter/cupertino.dart';
import '../models/aluno_model.dart';

class HomeController {
  List<TodoModel> todos = [];
  List<AlunoModel> alunos = [];

  //final TodoRepository _todoRepository;
  final AlunoRepository _alunoRepository;

  final state = ValueNotifier<HomeState>(HomeState.start);

  // HomeController({todoRepository, alunoRepository})
  //     : _todoRepository = todoRepository ?? TodoRepository(),
  //       _alunoRepository = alunoRepository ?? AlunoRepository();

  HomeController({alunoRepository})
      : _alunoRepository = alunoRepository ?? AlunoRepository();

  // HomeController({todoRepository})
  //     : _todoRepository = todoRepository ?? TodoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      //todos = await _todoRepository.fetchTodos();
      alunos = await _alunoRepository.fetchAlunos();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
