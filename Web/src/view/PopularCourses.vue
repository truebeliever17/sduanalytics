<template>
  <div class="container">
    <div class="selects">
      <b-field class="select-field" label="Term">
        <b-select
          v-model="selected_term"
          placeholder="Term"
          size="is-medium"
          expanded
        >
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
        </b-select>
      </b-field>
      <b-field class="select-field" label="Year">
        <b-select
          v-model="selected_year"
          placeholder="Year"
          size="is-medium"
          expanded
        >
          <option value="2016">2016</option>
          <option value="2017">2017</option>
          <option value="2018">2018</option>
          <option value="2019">2019</option>
        </b-select>
      </b-field>
    </div>

    <div class="center">
      <vs-button
        @click="handleClick"
        size="xl"
        :icon="success"
        :upload="sending"
        :color="success ? 'success' : 'primary'"
        block
      >
        <span v-if="!success">
          <i class="bx bx-search"></i>
          Search
        </span>

        <i class="bx bx-check" v-else></i>
      </vs-button>
    </div>
  </div>
</template>

<script>
import popular_courses from "../../database/json/popular_courses.json";
export default {
  data() {
    return {
      success: false,
      sending: false,
      selected_year: "2016",
      selected_term: "1",
      data: [],
    };
  },

  mounted() {},

  methods: {
    handleClick() {
      this.sending = true;
      if (this.selected_term.length > 0 && this.selected_year.length > 0) {
        console.log(this.selected_year);

        let filtered_data = popular_courses.filter(val => val.YEAR == +this.selected_year && val.TERM == +this.selected_term);

        console.log(filtered_data);
      }

      setTimeout(() => {
        this.sending = false;
        this.success = !this.success;
      }, 2000);
    },
  },
};
</script>

<style scoped>
.center {
  display: flex;
  justify-content: center;
  padding: 20px;
}
.selects {
  display: flex;
  padding: 4em;
  justify-content: center;
}

.select-field {
  margin: 1em;
}
</style>
