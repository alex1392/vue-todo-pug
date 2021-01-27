<template lang="pug">
	div
		TodoEditor(
			v-if="isEdit"
			:content="contentData"
			@cancel="onCancel"
			@save="onSave"
		)
		TodoCheckbox(
			v-else
			:id="id"
			:content="contentData"
			:checked="checked"
			@edit="onEdit"
			@delete="onDelete"
			@change="onChange"
		)
</template>

<script>
import TodoEditor from "./TodoEditor.vue";
import TodoCheckbox from "./TodoCheckbox.vue";

export default {
	model: {
		prop: "checked",
		event: "change",
	},
	components: {
		TodoEditor,
		TodoCheckbox,
	},
	props: ["id", "content", "checked"],
	data() {
		return {
			contentData: this.content,
			isEdit: false,
		};
	},
	methods: {
		onEdit() {
			this.isEdit = true;
		},
		onDelete() {
			this.$emit("delete");
		},
		onSave(newContent) {
			this.contentData = newContent;
			this.isEdit = false;
		},
		onCancel() {
			this.isEdit = false;
		},
		onChange(checked) {
			this.$emit("change", checked);
		},
	},
};
</script>

<style></style>
