import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'Create Form',
          style: Theme.of(context).appBarTheme.toolbarTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Form(
          child: ListView(
            children: [
              ListTile(
                  title: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent)),
                    hintText: 'Please input a title',
                    focusColor: Colors.redAccent,
                    labelText: 'Title',
                    labelStyle: TextStyle(color: Colors.redAccent),
                    floatingLabelBehavior: FloatingLabelBehavior.auto),
              )),
              const SizedBox(
                height: 20.0,
              ),
              ListTile(
                  title: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent)),
                    hintText: 'Please input a description',
                    focusColor: Colors.redAccent,
                    labelText: 'Description',
                    labelStyle: TextStyle(color: Colors.redAccent),
                    floatingLabelBehavior: FloatingLabelBehavior.auto),
              )),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ListTile(
                        title: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent)),
                          hintText: 'Please input a date',
                          focusColor: Colors.redAccent,
                          labelText: 'Date',
                          labelStyle: TextStyle(color: Colors.redAccent),
                          floatingLabelBehavior: FloatingLabelBehavior.auto),
                    )),
                  ),
                  Expanded(
                    child: ListTile(
                        title: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent)),
                          hintText: 'Please input a Time',
                          focusColor: Colors.redAccent,
                          labelText: 'Time',
                          labelStyle: TextStyle(color: Colors.redAccent),
                          floatingLabelBehavior: FloatingLabelBehavior.auto),
                    )),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              ListTile(
                title: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.all(25)),
                    onPressed: () {},
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
