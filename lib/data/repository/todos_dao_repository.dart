import 'package:todos_app/data/entity/todos.dart';
import 'package:todos_app/data/sqlite/database_helper.dart';

class ToDosDaoRepository {

  Future<void> save(String name) async{
    var db = await DatabaseHelper.veritabaniErisim();

    var newToDo = Map<String, dynamic>();
    newToDo["name"] = name;

    await db.insert("toDos", newToDo);
  }

  Future<void> update(int id, String name) async {
    var db = await DatabaseHelper.veritabaniErisim();

    var updatedToDo = Map<String, dynamic>();
    updatedToDo["name"] = name;

    await db.update("toDos", updatedToDo, where: "id=?", whereArgs: [id]);
  }

  Future<List<ToDos>> loadToDos() async {
    var db = await DatabaseHelper.veritabaniErisim();

    List<Map<String, dynamic>> list = await db.rawQuery("SELECT * FROM toDos");

    return List.generate(list.length, (index){
      var row = list[index];
      var id = row["id"];
      var name = row["name"];
      return ToDos(id: id, name: name);
    });
  }
  
  Future<List<ToDos>> search(String searchText) async {
    var db = await DatabaseHelper.veritabaniErisim();
    
    List<Map<String,dynamic>> list = await db.rawQuery("SELECT * FROM toDos WHERE name LIKE '%$searchText%' ");

    return List.generate(list.length, (index){
      var row = list[index];
      var id = row["id"];
      var name = row["name"];
      return ToDos(id: id, name: name);
    });
  }

  Future<void> delete(int id) async {
    var db = await DatabaseHelper.veritabaniErisim();
    await db.delete("toDos", where: "id=?", whereArgs: [id]);
  }
}