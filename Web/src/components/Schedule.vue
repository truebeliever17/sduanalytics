<template>
  <div class="container">
    <b-field class="select-field" label="Your ID">
      <b-input
        v-on:input="onChange()"
        placeholder="3F2F30658127C29328718C132E7C71CE6BD484D8"
        type="search"
        v-model="selected_id"
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

      <div v-else-if="hasData">
        <h1 class="results_h1">Result</h1>
        <div class="schedule_container">
          <table id="schedule_table">
            <tr>
              <th>Day/Hour</th>
              <th>Monday</th>
              <th>Tuesday</th>
              <th>Wednesday</th>
              <th>Thursday</th>
              <th>Friday</th>
              <th>Saturday</th>
            </tr>
            <tr v-for="(time, key, index) of schedule">
              <td class="start_time">
                <p>{{ key }}:00</p>
                <p>{{ key }}:50</p>
              </td>
              <td v-for="day in time">
                <div v-if="day.DERS_KOD">
                  <h3>{{ day.DERS_KOD }}</h3>
                  <p>{{ day.SECTION }}-N</p>
                </div>
              </td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import teachers_schedule from "../../database/json/teachers_schedule.json";
import students_schedule from "../../database/json/students_schedule.json";

export default {
  data() {
    return {
      success: false,
      loading: false,
      notfound: false,
      selected_id: "",
      selected_year: "2016",
      selected_term: "1",
      hasData: false,
      page: 1,
      disabled: true,
      schedule: {
        9: {
          Monday: "",
          Tuesday: "",
          Wednesday: "",
          Thursday: "",
          Friday: "",
          Saturday: "",
        },
        10: {
          Monday: "",
          Tuesday: "",
          Wednesday: "",
          Thursday: "",
          Friday: "",
          Saturday: "",
        },
        11: {
          Monday: "",
          Tuesday: "",
          Wednesday: "",
          Thursday: "",
          Friday: "",
          Saturday: "",
        },
        12: {
          Monday: "",
          Tuesday: "",
          Wednesday: "",
          Thursday: "",
          Friday: "",
          Saturday: "",
        },
        13: {
          Monday: "",
          Tuesday: "",
          Wednesday: "",
          Thursday: "",
          Friday: "",
          Saturday: "",
        },
        14: {
          Monday: "",
          Tuesday: "",
          Wednesday: "",
          Thursday: "",
          Friday: "",
          Saturday: "",
        },
        15: {
          Monday: "",
          Tuesday: "",
          Wednesday: "",
          Thursday: "",
          Friday: "",
          Saturday: "",
        },
        16: {
          Monday: "",
          Tuesday: "",
          Wednesday: "",
          Thursday: "",
          Friday: "",
          Saturday: "",
        },
        17: {
          Monday: "",
          Tuesday: "",
          Wednesday: "",
          Thursday: "",
          Friday: "",
          Saturday: "",
        },
        18: {
          Monday: "",
          Tuesday: "",
          Wednesday: "",
          Thursday: "",
          Friday: "",
          Saturday: "",
        },
        19: {
          Monday: "",
          Tuesday: "",
          Wednesday: "",
          Thursday: "",
          Friday: "",
          Saturday: "",
        },
        20: {
          Monday: "",
          Tuesday: "",
          Wednesday: "",
          Thursday: "",
          Friday: "",
          Saturday: "",
        },
        21: {
          Monday: "",
          Tuesday: "",
          Wednesday: "",
          Thursday: "",
          Friday: "",
          Saturday: "",
        },
      },
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
        this.selected_id.length == 0
      ) {
        this.disabled = true;
      } else {
        this.disabled = false;
      }
    },
    handleClick() {
      this.page = 1;
      this.loading = true;

      let filtered_data;
      if (this.selected_id.length > 10) {
        filtered_data = students_schedule.filter(
          (val) =>
            val.YEAR == +this.selected_year &&
            val.TERM == +this.selected_term &&
            val.STUD_ID == this.selected_id.toUpperCase()
        );
      } else {
        filtered_data = teachers_schedule.filter(
          (val) =>
            val.YEAR == +this.selected_year &&
            val.TERM == +this.selected_term &&
            val.EMP_ID == +this.selected_id
        );
      }

      if (filtered_data.length == 0) {
        this.notfound = true;
        this.loading = false;
        this.hasData = false;
      } else {
        for (let time of Object.keys(this.schedule)) {
          for (let day of Object.keys(this.schedule[time])) {
            this.schedule[time][day] = "";
          }
        }
        this.notfound = false;
        this.hasData = true;
        for (let elem of filtered_data) {
          this.schedule[+elem.START_TIME][elem.DAY.trim()] = elem;
        }
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

#schedule_table {
  border-collapse: collapse;
  border-spacing: 0;
  margin-left: auto;
  margin-right: auto;
  width: 100%;
}

.schedule_container {
  padding: 1em 0 2em 0;
}
#schedule_table td,
th {
  border: 1px solid #4a4a4a;
  text-align: center;
  padding: 1em;
  background-clip: padding-box; 
}

#schedule_table .start_time, #schedule_table th {
    background-color: #272d36; 
}

.results_notfound {
  margin-top: 1em;
  padding-bottom: 1.5em;
  font-size: 2rem;
  text-align: center;
}

#schedule_table p,
#schedule_table th {
  color: #adadad;
}

td {
    font-weight: bold;
}

#schedule_table h3 {
  color: white;
}

#schedule_table tr:hover {
  background-color: #272d36;
}

#schedule_table td:hover {
  background-color: #303640;
}

.custom_option {
  color: #a2a6ab;
}
#success_result {
  padding: 0.4em;
}

.center {
  display: flex;
  justify-content: center;
  padding: 1em 0;
}

.select-field {
  margin: 2em;
}
</style>
