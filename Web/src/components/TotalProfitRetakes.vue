<template>
  <div class="container">
    <div class="center">
      <vs-button
        @click="handleClick"
        size="xl"
        :icon="success"
        :upload="loading"
        :color="success ? 'success' : notfound ? 'danger' : 'primary'"
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

      <div v-else-if="data.length > 0">
        <h1 class="results_h1">Results</h1>
        <ol>
          <li>
            <h1><b>Profit:</b> {{ data[0].PROFIT }}</h1>
            <p><b>Total Retakes:</b> {{ data[0].RETAKES }}</p>
          </li>
        </ol>
      </div>
    </div>
  </div>
</template>

<script>
import all_retakes_info from "../../database/json/all_retakes_info.json";
export default {
  data() {
    return {
      success: false,
      loading: false,
      notfound: false,
      data: [],
    };
  },

  mounted() {},

  methods: {
    onChange() {
      this.success = false;
      this.notfound = false;
    },
    handleClick() {
      this.loading = true;

      if (all_retakes_info.length == 0) {
        this.notfound = true;
        this.loading = false;
        this.data = [];
      } else {
        this.notfound = false;
        this.data = all_retakes_info;
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
