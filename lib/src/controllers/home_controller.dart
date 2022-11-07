import 'package:api_fetch/src/models/todo_model.dart';
import 'package:api_fetch/src/repositories/todo_repository.dart';
import '../models/aluno_model.dart';
import '../repositories/aluno_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  List<AlunoModel> alunos = [];

  final TodoRepository _todoRepository;
  // final AlunoRepository _alunoRepository;

  // HomeController({todoRepository, alunoRepository})
  //     : _todoRepository = todoRepository ?? TodoRepository(),
  //       _alunoRepository = alunoRepository ?? AlunoRepository();

  HomeController({todoRepository})
      : _todoRepository = todoRepository ?? TodoRepository();

  Future start() async {
    todos = await _todoRepository.fetchTodos();
    // alunos = await _alunoRepository.fetchAlunos();
  }
}
