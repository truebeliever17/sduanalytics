import gpa from '../../database/json/gpa.json';

let data = {}
let g16=[];
let g17=[];
let g18=[];
let g19=[];
const arrAvg = arr => arr.reduce((a,b) => a + b, 0) / arr.length;
gpa.forEach((x) => {
    if (x['YEAR'] == 2016) {
        g16.push(x['GPA']);
    }
    if (x['YEAR'] == 2017) {
        g17.push(x['GPA']);
    }
    if (x['YEAR'] == 2018) {
        g18.push(x['GPA'])
    } 
    if (x['YEAR'] == 2019) {
        g19.push(x['GPA'])
    } 
})

data = {y16:arrAvg(g16), y17:arrAvg(g17), y18:arrAvg(g18), y19: arrAvg(g19)};
export default data;