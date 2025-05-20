import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app/data/entity/todos.dart';
import 'package:todos_app/ui/components/my_app_bar.dart';
import 'package:todos_app/ui/cubits/update_cubit.dart';
import 'package:todos_app/ui/tools/app_colors.dart';

class DetailScreen extends StatefulWidget {
  ToDos toDos;
  DetailScreen({required this.toDos});
  
  @override
  State<DetailScreen> createState() => _DetailScreenState();
  
}

class _DetailScreenState  extends State<DetailScreen>{
  var tfName = TextEditingController();
  
  @override
 void initState() {
    super.initState();
    tfName.text = widget.toDos.name;
  }
  
  @override
  Widget build(BuildContext context){
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screeenWidth = screenInfo.size.width;
    
    return Scaffold(
      appBar: MyAppBar(title: "Detail Screen"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: tfName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "toDo name",
                ),
              ),
            ),
           SizedBox(width: screeenWidth/2, height: screenHeight/15,
           child: ElevatedButton(
               onPressed: (){
                 context.read<DetailCubit>().update(widget.toDos.id, tfName.text);
                 },
               style: ElevatedButton.styleFrom(backgroundColor: buttonColor2),
               child: Text("UPDATE", style: TextStyle(color: textColor2),),
           ),
           ),
          ],
        ),
      ),
    );
  }
}