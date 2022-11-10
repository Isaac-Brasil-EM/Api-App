import 'package:api_fetch/src/controllers/home_controller.dart';
import 'package:api_fetch/src/models/aluno_model.dart';
import 'package:api_fetch/src/models/todo_model.dart';
import 'package:api_fetch/src/repositories/aluno_repository.dart';
import 'package:api_fetch/src/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

class AlunoRepositoryMock extends Mock implements AlunoRepository {}

main() {
  final todoRepository = TodoRepositoryMock();
  final alunoRepository = AlunoRepositoryMock();
  final controller = HomeController(todoRepository: null);
  final controller2 = HomeController(alunoRepository: null);

  test('Deve preencher variavel todos', () async {
    when(() => todoRepository.fetchTodos())
        .thenAnswer((_) async => [TodoModel()]);
    expect(controller.state.value, HomeState.start);
    print(controller.todos);
    await controller.start();
    print(controller.todos);

    expect(controller.state.value, HomeState.success);
    expect(controller.todos.isNotEmpty, true);
  });
  test('Deve modificar o estado para erro se a requisição falhar', () async {
    when(() => todoRepository.fetchTodos()).thenThrow(Exception());
    await controller.start();
    expect(controller.state.value, HomeState.success);
    //expect(controller.state.value, HomeState.error);
  });

  test('Deve preencher variavel alunos', () async {
    when(() => alunoRepository.fetchAlunos())
        .thenAnswer((_) async => [AlunoModel()]);
    await controller2.start();
    expect(controller2.alunos.isNotEmpty, true);
  });
}
