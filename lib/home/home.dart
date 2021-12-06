import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
              color: Colors.black,
              fontSize:
                  Theme.of(context).appBarTheme.toolbarTextStyle!.fontSize),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.sort,
                size: Theme.of(context).appBarTheme.iconTheme!.size,
              )),
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
    );
  }
}
