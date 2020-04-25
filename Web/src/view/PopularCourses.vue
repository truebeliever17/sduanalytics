<template>
  <div class="container">
    <div class="selects">
      <b-field class="select-field" label="Term">
        <b-select
          v-model="selected_term"
          v-on:input="onChange()"
          placeholder="Term"
          size="is-medium"
          expanded
        >
          <option class="custom_option" value="1">1</option>
          <option class="custom_option" value="2">2</option>
          <option class="custom_option" value="3">3</option>
        </b-select>
      </b-field>
      <b-field class="select-field" label="Year">
        <b-select
          v-model="selected_year"
          v-on:input="onChange()"
          placeholder="Year"
          size="is-medium"
          expanded
        >
          <option class="custom_option" value="2016">2016</option>
          <option class="custom_option" value="2017">2017</option>
          <option class="custom_option" value="2018">2018</option>
          <option class="custom_option" value="2019">2019</option>
        </b-select>
      </b-field>
    </div>

    <div class="center">
      <vs-button
        @click="handleClick"
        size="xl"
        :icon="success"
        :upload="loading"
        :color="success ? 'success' : 'primary'"
        block
      >
        <span v-if="!success">
          <i class="bx bx-search"></i>
          Search
        </span>
        <span id="success_result" v-else>
          <i class="bx bx-check bx-lg"></i>
        </span>
      </vs-button>
    </div>

    <div class="results">
      <h1 v-if="data.length > 0" id="results_h1">Results</h1>
      <ol>
        <li v-for="rec in data">
          <h1>{{ rec.DERS_KOD }}</h1>
          <p>Students count: {{ rec.REG_COUNT }}</p>
          <p v-if="rec.DIFF">
            The course was selected in
            {{ Math.round(+rec.REG_COUNT * +rec.DIFF) }} hours
          </p>
        </li>
      </ol>
    </div>
  </div>
</template>

<script>
import popular_courses from "../../database/json/popular_courses.json";
export default {
  data() {
    return {
      success: false,
      loading: false,
      selected_year: "2016",
      selected_term: "1",
      data: [],
    };
  },

  mounted() {},

  methods: {
    onChange() {
      this.success = false;
    },
    handleClick() {
      this.loading = true;
      if (this.selected_term.length > 0 && this.selected_year.length > 0) {
        let filtered_data = popular_courses.filter(
          (val) =>
            val.YEAR == +this.selected_year && val.TERM == +this.selected_term
        );

        if (filtered_data.length == 0) {
          // todo
        } else {
          this.data = filtered_data;
          this.loading = false;
          this.success = true;
        }
      }
    },
  },
};
</script>

<style scoped>
#results_h1 {
  margin-top: 1em;
  font-size: 2rem;
  text-align: center;
}
h1 {
  font-weight: bold;
  color: #dbdbdb;
}

p,
li {
  color: #adadad;
}

li {
  list-style: none;
  padding: 1em;
  margin: 1em 0;
  list-style-position: inside;
  border: 1px solid #adadad;
  border-radius: 4px;
}

.custom_option {
    color: #a2a6ab;
}
#success_result {
    padding: 0.4em;
}
li:hover {
  background-color: #2b333d;
}

.bx bx-check {
}
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
  margin: 2em;
}
</style>
