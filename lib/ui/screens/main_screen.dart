import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app/data/entity/todos.dart';
import 'package:todos_app/ui/components/my_app_bar.dart';
import 'package:todos_app/ui/cubits/main_cubit.dart';
import 'package:todos_app/ui/screens/save_screen.dart';
import 'package:todos_app/ui/screens/detail_screen.dart';
import 'package:todos_app/ui/tools/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    super.initState();
    context.read<MainCubit>().loadToDos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "ToDos",),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoSearchTextField(
                placeholder: "Search",
                onChanged: (searchText){
                  context.read<MainCubit>().search(searchText);
                },
              ),
            ),
            BlocBuilder<MainCubit,List<ToDos>>(
              builder: (context,toDosList){
                if(toDosList.isNotEmpty){
                  return Expanded(
                    child: ListView.builder(
                      itemCount: toDosList.length,
                      itemBuilder: (context,index){
                        var toDo = toDosList[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(toDos: toDo)))
                                .then((_){
                              context.read<MainCubit>().loadToDos();
                            });
                          },
                          child: Card(
                              child: Row(
                                children: [
                                  Padding(

                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(toDo.name,style: TextStyle(fontSize: 20),),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: mainColor,
                                            title: Text(
                                              "Delete",
                                              style: TextStyle(color: textColor2),

                                            ),
                                            content: Text(
                                              "Do you want to delete '${toDo.name}'?",
                                              style: TextStyle(color: textColor2),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text("Yes", style: TextStyle(color: textColor2)),
                                                onPressed: () {
                                                  context.read<MainCubit>().delete(toDo.id); // silme işlemi
                                                  Navigator.of(context).pop(); // dialog'u kapat
                                                },
                                              ),
                                              TextButton(
                                                child: Text("No", style: TextStyle(color: textColor2)),
                                                onPressed: () {
                                                  Navigator.of(context).pop(); // dialog'u kapat
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.clear, color: textColor1),
                                  ),

                                ],
                              )
                          ),
                        );
                      },
                    ),
                  );
                }else{
                  return const Center();
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SaveScreen()))
              .then((_){
            context.read<MainCubit>().loadToDos();
          });
        },
        child: Icon(Icons.add, color: textColor1),
      ),
    );
  }
}
