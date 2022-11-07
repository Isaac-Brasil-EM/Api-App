//@dart=2.9
import 'package:api_fetch/src/controllers/home_controller.dart';
import 'package:api_fetch/src/models/aluno_model.dart';
import 'package:api_fetch/src/models/todo_model.dart';
import 'package:api_fetch/src/repositories/aluno_repository.dart';
import 'package:api_fetch/src/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

// class AlunoRepositoryMock extends Mock implements AlunoRepository {}

main() {
  final todoRepository = TodoRepositoryMock();
  // final alunoRepository = AlunoRepositoryMock();

  final controller = HomeController(todoRepository: todoRepository);
  test('Deve preencher variavel todos', () async {
    await controller.start();

    when(todoRepository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);

    expect(controller.todos.isNotEmpty, true);
  });
  // final controller2 = HomeController(alunoRepository: alunoRepository);

  // test('Deve preencher variavel alunos', () async {
  //   await controller2.start();

  //   when(alunoRepository.fetchAlunos()).thenAnswer((_) async => [AlunoModel()]);

  //   expect(controller2.alunos.isNotEmpty, true);
  // });
}
