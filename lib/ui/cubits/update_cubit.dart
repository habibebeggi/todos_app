import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app/data/repository/todos_dao_repository.dart';

class DetailCubit extends Cubit<void> {
  DetailCubit() : super(0);
  var toDosDaoRepository = ToDosDaoRepository();

  Future<void> update(int id, String name) async {
    await toDosDaoRepository.update(id, name);
  }
}