<template>
  <section>
    <h1>
      Select a service which you want
    </h1>
    <b-field>
      <b-select
        id="b-select"
        v-model="selected"
        placeholder="Services"
        size="is-large"
        expanded
      >
        <option class="custom-option" value="popular_courses"
          >Find most popular courses</option
        >
        <option class="custom-option" value="popular_teachers"
          >Find most popular teachers</option
        >
        <option class="custom-option" value="gpa">Calculate GPA</option>
        <option class="custom-option" value="nonregistered"
          >Find nonregistered students</option
        >
        <option class="custom-option" value="retake"
          >Calculate students retake expenses</option
        >
        <option class="custom-option" value="working_hours"
          >Calculate teachers working hours</option
        >
        <option class="custom-option" value="schedule">Find schedule</option>
        <option class="custom-option" value="subjects"
          >Display students subjects number</option
        >
        <option class="custom-option" value="mostcleverflow"
          >Find most clever flow of teacher</option
        >
        <option class="custom-option" value="teachersrating"
          >Display teachers rating</option
        >
        <option class="custom-option" value="subjectsrating"
          >Display subjects rating</option
        >
        <option class="custom-option" value="totalprofit"
          >Calculate total profit of all retakes</option
        >
      </b-select>
    </b-field>
    <popularcourses v-if="selected == 'popular_courses'"></popularcourses>
  </section>
  
</template>

<script>
import popularcourses from '../components/PopularCourses.vue';
export default {
  data() {
    return {
      selected: "",
    };
  },
  components: {
      popularcourses,
  }
};
</script>
<style scoped>
h1 {
  text-align: center;
  color: white;
  text-align: center;
  font-size: 3em;
  font-weight: bold;
  margin: 0 0 2rem 0;
}
section {
  width: 50%;
  margin: auto;
  padding: 5rem 0 0 0;
  transition: 1s ease-in-out;
}

.custom-option {
  color: #a2a6ab;
}
</style>
