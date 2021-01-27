<template lang="pug">
	#app
		h1 Todo List
		h2 {{ listSummary }}
		ul
			li(
				v-for="todo in todoList"
				:key="todo.id"
			)
				TodoItem(
					:id="todo.id"
					:content="todo.content"
					v-model="todo.checked"
					@delete="DeleteTodo(todo.id)"
				)
		
		label New Todo:
		input(
			type="text"
			v-model.lazy.trim="newTodo"
		)
		button(
			type="button"
			@click="AddTodo"
		) Add
</template>

<script>
import TodoItem from "./components/TodoItem.vue";

export default {
	name: "App",
	components: {
		TodoItem,
	},
	data() {
		return {
			newTodoId: 1,
			newTodo: "",
			todoList: [],
		};
	},
	methods: {
		AddTodo() {
			if (!this.newTodo) {
				return;
			}
			this.todoList.push({
				id: "todo-" + this.newTodoId++,
				content: this.newTodo,
				checked: false,
			});
			this.newTodo = "";
		},
		DeleteTodo(id) {
			var index = this.todoList.findIndex((todo) => todo.id === id);
			this.todoList.splice(index, 1);
		},
	},
	// dependent properties
	computed: {
		listSummary() {
			return `${this.todoList.filter((item) => item.checked).length} out of ${
				this.todoList.length
			} tasks completed.`;
		},
	},
};
</script>

<style>
#app {
	font-family: Avenir, Helvetica, Arial, sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	text-align: center;
	color: #2c3e50;
	margin-top: 60px;
}
</style>
