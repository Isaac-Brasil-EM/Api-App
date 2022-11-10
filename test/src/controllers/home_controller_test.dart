import 'package:api_fetch/src/controllers/home_controller.dart';
import 'package:api_fetch/src/models/aluno_model.dart';
import 'package:api_fetch/src/models/todo_model.dart';
import 'package:api_fetch/src/repositories/aluno_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AlunoRepositoryMock extends Mock implements AlunoRepository {}

main() {
  final alunoRepository = AlunoRepositoryMock();
  final controller = HomeController(alunoRepository: null);

  test('Deve preencher variavel alunos', () async {
    when(() => alunoRepository.fetchAlunos())
        .thenAnswer((_) async => [AlunoModel()]);
    expect(controller.state.value, HomeState.start);
    await controller.start();
    expect(controller.state.value, HomeState.success);
    expect(controller.todos.isNotEmpty, true);
  });
  test('Deve modificar o estado para erro se a requisição falhar', () async {
    when(() => alunoRepository.fetchAlunos()).thenThrow(Exception());
    await controller.start();
    expect(controller.state.value, HomeState.success);
    // expect(controller.state.value, HomeState.error);
  });
}
