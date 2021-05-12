import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/todo.dart';
import 'package:state_management/exercise2/todo_cubit.dart';

final data = <TodoModel>[
  TodoModel(id: 'id-0', title: 'Todo 0'),
  TodoModel(id: 'id-1', title: 'Todo 1'),
  TodoModel(id: 'id-2', title: 'Todo 2'),
];

class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoCubit>(
      create: (_) => TodoCubit()..init(),
      child: Scaffold(
        body: Center(
          child: TodoLayout(),
        ),
        floatingActionButton: AddButton(),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        //cubit read here
        TodoModel todo = generateNewItem(context);
        context.read<TodoCubit>().add(todo);
      },
      child: Icon(Icons.add),
    );
  }
}

class TodoLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = context.watch<TodoCubit>().state.data;
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
        leading: IconButton(
          onPressed: () {
            context.read<TodoCubit>().toggle(getIndexFromId(id));
          },
          icon:
              Icon(completed ? Icons.check_box : Icons.check_box_outline_blank),
          tooltip: 'todo checkbox',
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: completed ? FontWeight.bold : FontWeight.normal,
            decoration:
                completed ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: IconButton(
            onPressed: () {
              context.read<TodoCubit>().remove(getIndexFromId(id));
            },
            icon: Icon(
              Icons.highlight_remove_sharp,
              color: Colors.blue,
            )),
      ),
    );
  }
}

int getIndexFromId(String id) {
  return int.parse(id.split("-")[1]);
}

TodoModel generateNewItem(BuildContext context) {
  String id = context.read<TodoCubit>().state.data.last.id;
  int index = getIndexFromId(id) + 1;
  TodoModel item =
      TodoModel(id: "id-$index", title: "Todo $index", completed: false);
  return item;
}
