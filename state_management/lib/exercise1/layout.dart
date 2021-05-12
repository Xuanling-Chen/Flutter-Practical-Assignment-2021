import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/todo.dart';

final data = <TodoModel>[
  TodoModel(id: 'id-0', title: 'Todo 0'),
  TodoModel(id: 'id-1', title: 'Todo 1'),
  TodoModel(id: 'id-2', title: 'Todo 2'),
];

class TodoItem extends StatelessWidget {
  final String id;
  final String title;
  final bool completed;

  const TodoItem(this.id, this.title, this.completed);

  @override
  Widget build(BuildContext context) {
    /// @TODO: Implement your todo item here.
    return Container(
      child: ListTile(
        // leading: put the icon here and toggle by click
        leading: IconButton(
          icon: Icon(Icons.check_box_outline_blank),
          tooltip: 'todo checkbox',
        ),
        title: Text(title),
        // trailing: put the remove icon here and listen it's click event,
        trailing: Icon(
          Icons.highlight_remove_sharp,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class TodoAppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // @TODO: Implement the layout
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO App'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
          thickness: 0.5,
        ),
        itemCount: data.length,
        itemBuilder: (ctx, i) =>
            TodoItem(data[i].id, data[i].title, data[i].completed),
      ),
    );
  }
}
