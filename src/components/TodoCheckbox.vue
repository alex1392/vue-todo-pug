<template lang="pug">
.input-group.mb-2
  .form-control
    input(type="checkbox", :id="id", :checked="checked", @change="onChange")
    label {{ content }}
  .input-group-append
    .btn-group
      button.btn.btn-outline-primary(type="button", @click="onEdit").
        
        Edit
      button.btn.btn-outline-danger#btn-end(type="button", @click="onDelete").
        
        Delete
        
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

<style scoped>
input {
	width: 25px;
	height: 25px;
}
.input-group-text {
	background-color: transparent;
	border: none;
}
.form-control {
	padding: 6px;
}
label {
	vertical-align: super;
	margin-left: 5px;
}
#btn-end {
	margin-left: 0.5px;
}
</style>
