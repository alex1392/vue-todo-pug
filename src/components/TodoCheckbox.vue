<template lang="pug">
	div
		input(
			type="checkbox"
			:id="id"
			:checked="checked"
			@change="onChange"
		) 
		| {{ content }}
		button(
			type="button"
			@click="onEdit"
		) Edit
		button(
			type="button"
			@click="onDelete" 
		) Delete
</template>

<script>
export default {
	props: ["id", "content", "checked"],
	methods: {
		onEdit() {
			this.$emit("edit");
		},
		onDelete() {
			this.$emit("delete");
		},
		onChange(event) {
			this.$emit("change", event.target.checked);
		},
	},
};
</script>

<style></style>
