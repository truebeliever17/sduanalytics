<template lang="html">
  <div :class="{ tabs__light: mode === 'light', tabs__dark: mode === 'dark' }">
    <ul class="tabs__header">
      <li
        v-for="(tab, index) in tabs"
        :key="tab.title"
        @click="selectTab(index)"
        :class="{ tab__selected: index == selectedIndex }"
      >
        {{ tab.title }}
      </li>
    </ul>
    <slot></slot>
  </div>
</template>

<script>
export default {
  name: "tabs",
  props: {
    mode: {
      type: String,
      default: "light",
    },
  },
  data() {
    return {
      selectedIndex: 0, // the index of the selected tab,
      tabs: [], // all of the tabs
    };
  },
  created() {
    this.tabs = this.$children;
  },
  mounted() {
    this.selectTab(0);
  },
  methods: {
    selectTab(i) {
      this.selectedIndex = i;

      // loop over all the tabs
      this.tabs.forEach((tab, index) => {
        tab.isActive = index === i;
      });
    },
  },
};
</script>

<style lang="css">
ul.tabs__header {
  display: block;
  list-style: none;
  margin: 0;
  padding: 0;
}

ul.tabs__header > li {
  padding: 12px 12px;
  margin: 10px 0;

  display: inline-block;
  border-bottom: 4px solid #2d333b;

  cursor: pointer;
}

ul.tabs__header > li.tab__selected {
  font-weight: bold;
}

.tabs__dark .tab {
  color: #eee;
}

.tabs__dark li {
  color: #aaa;
}

.tabs__dark li:hover {
  color: white;
}

.tabs__dark li.tab__selected {
  border-bottom: 4px solid #1831d6;
  transition: 0.1s ease-in-out;  
  color: white;
}
</style>
