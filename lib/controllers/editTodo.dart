import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/todo_provider.dart';

class EditTodo extends StatefulWidget {
  const EditTodo({super.key});

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  //provider call
  @override
  Widget build(BuildContext context) {
    TodoProvider provider = Provider.of<TodoProvider>(context);

//catch those arg
    final Document arguments =
        ModalRoute.of(context)?.settings.arguments as Document;
    titleController.text = arguments.data['title'];
    descController.text = arguments.data['description'];
    return Scaffold(
      appBar: AppBar(title: Text("Edit Todo")),
      body: Column(children: [
        TextFormField(
          controller: titleController,
          decoration: InputDecoration(label: Text("Title")),
        ),
        TextFormField(
          controller: descController,
          decoration: InputDecoration(label: Text("Description")),
        ),
        ElevatedButton(
            onPressed: () {
              provider.updateTodo(
                  titleController.text, descController.text, arguments.$id);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Todo Added")));
              Navigator.pop(context);
            },
            child: Text("Update Todo"))
      ]),
    );
  }
}
