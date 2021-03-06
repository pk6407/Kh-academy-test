package kr.or.iei;

import java.util.ArrayList;
import java.util.List;

public class TodoRepository {

    private static final TodoRepository INSTANCE = new TodoRepository();
    private final List<Todo> todoList = new ArrayList<>();

    private TodoRepository() {
    }

    public static TodoRepository getInstance() {
        return INSTANCE;
    }

    public void saveTodo(Todo todo) {
        todoList.add(todo);
    }

    public List<Todo> getTodoList() {
        return todoList;
    }
}
