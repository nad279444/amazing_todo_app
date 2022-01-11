import 'package:amazing_todo_app/model/todo_model.dart';
import 'package:amazing_todo_app/shared_widgets/card_widget.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key? key, required this.todos}) : super(key: key);
  final Todo? todos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white38, borderRadius: BorderRadius.circular(10.0)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                CardWidget(data: todos!.data[index]),
            itemCount: todos!.data.length,
          )),
    );
  }
}
