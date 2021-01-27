<template lang="pug">
	div
		input( 
			type="text"
			v-model="contentData"
		)
		button(
			type="button"
			@click="onSave"
		) Save
		button(
			type="button"
			@click="onCancel"
		) Cancel
</template>

<script>
export default {
	props: ["content"],
	data() {
		return {
			contentData: this.content,
		};
	},
	methods: {
		onSave() {
			this.$emit("save", this.contentData);
		},
		onCancel() {
			this.$emit("cancel");
		},
	},
};
</script>

<style></style>
