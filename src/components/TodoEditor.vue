<template lang="pug">
	.input-group.mb-2
		input.form-control( 
			type="text"
			v-model="contentData"
		)
		.input-group-append
			.button-group
				button.btn.btn-primary(
					type="button"
					@click="onSave"
				) Save
				button.btn.btn-danger(
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
