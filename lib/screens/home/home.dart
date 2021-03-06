import 'package:amazing_todo_app/controller/todo_controller.dart';
import 'package:amazing_todo_app/model/todo_model.dart';
import 'package:amazing_todo_app/screens/form/form.dart';
import 'package:amazing_todo_app/shared_widgets/container_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int value = 1;

  final TodoController _todoController = TodoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50,
        leading: const Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: CircleAvatar(
              radius: 35.0,
              backgroundColor: Colors.blue,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvpHyV1CIF0B0kSSsW3-rX2l4ovm1325bPGw&usqp=CAU')),
        ),
        title: Text(
          'My Tasks',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).appBarTheme.toolbarTextStyle!.color,
              fontSize:
                  Theme.of(context).appBarTheme.toolbarTextStyle!.fontSize),
        ),
        actions: [
          PopupMenuButton(
              color: Colors.blue,
              icon: const Icon(Icons.menu_book_rounded),
              onSelected: (int value) {
                setState(() {
                  this.value = value;
                });
              },
              itemBuilder: (BuildContext context) => const [
                    PopupMenuItem(
                      child: Text(
                        'Todo',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text('Completed',
                          style: TextStyle(color: Colors.white)),
                      value: 2,
                    ),
                  ]),
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: Theme.of(context).appBarTheme.iconTheme!.size,
                )),
          ),
        ],
      ),
      body: FutureBuilder<Todo?>(
          key: UniqueKey(),
          future: _todoController.getAllTodosRequest(),
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
              case ConnectionState.active:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                return ContainerWidget(todos: snapshot.data);
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const FormInput()));
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
