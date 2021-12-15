import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormInput extends StatefulWidget {
  const FormInput({Key? key}) : super(key: key);

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  final TextEditingController _timeController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.clear();
    _descriptionController.clear();
    _dateController.clear();
    _timeController.clear();

    super.dispose();
  }

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
          key: _formKey,
          child: ListView(
            children: [
              ListTile(
                  title: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'title cannot be left empty';
                  }
                },
                controller: _titleController,
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
                controller: _descriptionController,
                validator: (value) =>
                    value!.isEmpty ? 'Enter a valid description' : null,
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
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)))
                            .then((value) {
                          setState(() {
                            _dateController.text =
                                DateFormat.yMMMEd().format(value!);
                          });
                        });
                      },
                      controller: _dateController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a date';
                        }
                      },
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
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          setState(() {
                            _timeController.text = value!.format(context);
                          });
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a time';
                        }
                      },
                      controller: _timeController,
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        String dateTime =
                            '${_dateController.text} ${_timeController.text} ';
                        print(_titleController.text);
                        print(_descriptionController.text);
                        print(dateTime);

                        _titleController.clear();
                        _descriptionController.clear();
                        _dateController.clear();
                        _timeController.clear();
                      }
                    },
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
