part of todo_cubit;

class TodoState extends Equatable {
  final List<TodoModel> data;

  const TodoState({this.data = const <TodoModel>[]});

  ///@TODO:Return a TOTALLY new [TodoState]
  TodoState copyWith(List<TodoModel> data) {
    final dataCopy = data.map((e) => e.copyWith()).toList();
    final newCopy = TodoState(data: dataCopy);
    return newCopy;
  }

  TodoState add(TodoModel todo) {
    /// @TODO: Finish this add method
    data.add(todo);
    return this;
  }

  TodoState remove(int index) {
    /// @TODO: Finish this [remove] method
    data.removeAt(index);
    return this;
  }

  TodoState toggle(int index, bool completed) {
    /// @TODO: Finish this [toggle] method
    TodoModel model = data.elementAt(index);
    data[index] = model.copyWith(completed: completed);
    return this;
  }

  /// Will rewrite operator == by [Equatable]
  @override
  List<Object> get props => [data];

  @override
  String toString() => data.map((each) => '$each').join('\n');
}
