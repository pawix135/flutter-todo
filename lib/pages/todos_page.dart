import 'package:flutter/cupertino.dart';
import 'package:todo_flutter/models/todo_model.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  late List<Todo> _todos;
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'initial text');
    _todos = [Todo(title: "Ekhem", done: false)];
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void toggleTodo(int index) {
    setState(() {
      _todos[index].done = !_todos[index].done;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          var todo = _todos[index];
          return Container(
            padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
            margin: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: CupertinoColors.darkBackgroundGray),
            child: Row(
              children: [
                Text(todo.title),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: CupertinoTextField(
                    controller: _textController,
                  ),
                ),
                const SizedBox(width: 10),
                CupertinoSwitch(
                    value: todo.done,
                    onChanged: (value) {
                      toggleTodo(index);
                    })
              ],
            ),
          );
        });
  }
}
