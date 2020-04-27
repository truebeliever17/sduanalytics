import popular_courses from '../../database/json/popular_courses.json';

let data  = {
    y16: {
        labels: [],
        data: []
    },
    y17: {
        labels: [],
        data: []
    },
    y18: {
        labels: [],
        data: []
    },
    y19: {
        labels: [],
        data: []
    }
    
};
popular_courses.forEach((x) => {
    if ((x['DERS_KOD'].substring(0,3) == "FIN" || x['DERS_KOD'].substring(0,3) == "MAR" || x['DERS_KOD'].substring(0,3) == "ACC") &&  x['YEAR'] == 2016) {
        data.y16.labels.push(x['DERS_KOD']);
        data.y16.data.push(x['REG_COUNT']);
    }
    if ((x['DERS_KOD'].substring(0,3) == "FIN" || x['DERS_KOD'].substring(0,3) == "MAR" || x['DERS_KOD'].substring(0,3) == "ACC") &&  x['YEAR'] == 2017) {
        data.y17.labels.push(x['DERS_KOD']);
        data.y17.data.push(x['REG_COUNT']);
    }
    if ((x['DERS_KOD'].substring(0,3) == "FIN" || x['DERS_KOD'].substring(0,3) == "MAR" || x['DERS_KOD'].substring(0,3) == "ACC") &&  x['YEAR'] == 2018) {
        data.y18.labels.push(x['DERS_KOD']);
        data.y18.data.push(x['REG_COUNT']);
    }

    if ((x['DERS_KOD'].substring(0,3) == "FIN" || x['DERS_KOD'].substring(0,3) == "MAR" || x['DERS_KOD'].substring(0,3) == "ACC") &&  x['YEAR'] == 2019) {
        data.y19.labels.push(x['DERS_KOD']);
        data.y19.data.push(x['REG_COUNT']);
    }
});
export default data;