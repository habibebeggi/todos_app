import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app/data/repository/todos_dao_repository.dart';

class SaveCubit extends Cubit<void> {
  SaveCubit() : super(0);
  var toDosDaoRepository = ToDosDaoRepository();

  Future<void> save(String name) async {
    await toDosDaoRepository.save(name);
  }
}