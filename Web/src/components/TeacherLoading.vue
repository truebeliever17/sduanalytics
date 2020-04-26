<template>
  <div class="container">
    <b-field class="select-field" label="Teacher ID">
      <b-input
        v-on:input="onChange()"
        placeholder="10124"
        type="search"
        v-model="selected_teacher"
        icon="book"
        size="is-medium"
        expanded
      >
      </b-input>
    </b-field>
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
        :color="success ? 'success' : notfound ? 'danger' : 'primary'"
        :disabled="disabled"
        block
      >
        <span v-if="notfound">
          <i class="bx bx-x bx-lg"></i>
        </span>
        <span v-else-if="!success">
          <i class="bx bx-search"></i>
          Search
        </span>
        <span id="success_result" v-else>
          <i class="bx bx-check bx-lg"></i>
        </span>
      </vs-button>
    </div>

    <div class="results">
      <h1 class="results_notfound" v-if="notfound">Not Found</h1>
      <div v-if="Object.keys(data).length !== 0 && data.constructor === Object">
        <h1 class="results_h1">Result</h1>
        <ol>
          <li>
            <h1>{{ data.EMP_ID }}</h1>
            <p><b>Hours:</b> {{ data.HOURS }}</p>
          </li>
        </ol>
        <div class="center" v-if="data.length > 0">
          <vs-pagination
            class="test"
            v-model="page"
            :length="Math.ceil(data.length / 5)"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import teachers_loading from "../../database/json/teachers_loading.json";
export default {
  data() {
    return {
      success: false,
      loading: false,
      notfound: false,
      selected_teacher: "",
      selected_year: "2016",
      selected_term: "1",
      data: {},
      page: 1,
      disabled: true,
    };
  },

  mounted() {},

  methods: {
    onChange() {
      this.success = false;
      this.notfound = false;
      if (
        this.selected_term.length == 0 ||
        this.selected_year.length == 0 ||
        this.selected_teacher.length == 0
      ) {
        this.disabled = true;
      } else {
        this.disabled = false;
      }
    },
    handleClick() {
      this.page = 1;
      this.loading = true;

      let filtered_data = teachers_loading.filter(
        (val) =>
          val.YEAR == +this.selected_year &&
          val.TERM == +this.selected_term &&
          val.EMP_ID == +this.selected_teacher
      );

      if (filtered_data.length == 0) {
        this.notfound = true;
        this.loading = false;
        this.data = [];
      } else {
        this.notfound = false;
        this.data = filtered_data[0];
        this.loading = false;
        this.success = true;
      }
    },
  },
};
</script>

<style scoped>
.results_h1 {
  margin-top: 1em;
  font-size: 2rem;
  text-align: center;
}

h1 {
  font-size: 1.2rem;
  font-weight: bold;
  color: #dbdbdb;
}

.results_notfound {
  margin-top: 1em;
  padding-bottom: 1.5em;
  font-size: 2rem;
  text-align: center;
}

.vs-icon-arrow {
  color: white;
}
p,
li {
  color: #adadad;
}
ol {
  padding-bottom: 2em;
}
li {
  list-style: none;
  padding: 1em;
  margin: 1em 0 0 0;
  list-style-position: inside;
  border: 1px solid #333b45;
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
  padding: 1em 0;
}
.selects {
}

.select-field {
  margin: 2em;
}
</style>
