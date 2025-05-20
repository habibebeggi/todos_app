import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app/data/entity/todos.dart';
import 'package:todos_app/data/repository/todos_dao_repository.dart';

class MainCubit extends Cubit<List<ToDos>> {
  MainCubit() : super(<ToDos>[]);
  var toDosDaoRepository = ToDosDaoRepository();

  Future<void> loadToDos() async {
    var list = await toDosDaoRepository.loadToDos();
    emit(list);
  }

  Future<void> search(String searchText) async {
    var list = await toDosDaoRepository.search(searchText);
    emit(list);
  }

  Future<void> delete(int id) async {
    await toDosDaoRepository.delete(id);
    await loadToDos();
  }
}