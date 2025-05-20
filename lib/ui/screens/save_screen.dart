import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app/ui/components/my_app_bar.dart';
import 'package:todos_app/ui/cubits/save_cubit.dart';
import 'package:todos_app/ui/tools/app_colors.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  var tfName = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    return Scaffold(
      appBar: MyAppBar(title: "Save Screen"),
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
            SizedBox(
              width: screenWidth / 2,
              height: screenHeight / 15,
              child: ElevatedButton(
                onPressed: () {
                  context.read<SaveCubit>().save(tfName.text);
                },
                style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                child: Text(
                  "SAVE",
                  style: TextStyle(color: textColor2),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}


