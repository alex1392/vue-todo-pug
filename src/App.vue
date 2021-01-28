<template lang="pug">
.card#app
	.card-body
		h1.card-title Todo List
		h3 {{ listSummary }}
		ul.list-group
			li.list-group-item(v-for="todo in todoList", :key="todo.id")
				todo-item(:id="todo.id", :content="todo.content", v-model="todo.checked", @delete="DeleteTodo(todo.id)")
		label(for="add-btn") New Todo:
		.input-group.mb-3
			input.form-control(type="text", placeholder="Type your new task here...", v-model.lazy.trim="newTodo")
			.input-group-append
				button.btn.btn-outline-primary#add-btn(type="button", @click="AddTodo")  Add
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

<style scoped>
#app {
	font-family: Avenir, Helvetica, Arial, sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	color: #2c3e50;
	margin: 10%;
}
.list-group-item {
	padding: 0;
	border: none;
}
.list-group {
	list-style-type: none;
}
label {
	margin-top: 15px;
}
</style>
