import gpa from '../../database/json/gpa.json';


const arrAvg = arr => arr.reduce((a,b) => a + b, 0) / arr.length;




let term161 = [];
let term162 = [];
let term163 = [];
let term171 = [];
let term172 = [];
let term173 = [];

let term181 = [];
let term182 = [];
let term183 = [];

let term192 = [];
let term193 = [];

let term191 = [];


gpa.forEach((x)=> {
    if(x.YEAR==2016 && x.TERM==1) {term161.push(x.GPA)};
    if(x.YEAR==2016 && x.TERM==2) {term162.push(x.GPA)};
    if(x.YEAR==2016 && x.TERM==3) {term163.push(x.GPA)};
    
    if(x.YEAR==2017 && x.TERM==1) {term171.push(x.GPA)};
    if(x.YEAR==2017 && x.TERM==2) {term172.push(x.GPA)};
    if(x.YEAR==2017 && x.TERM==3) {term173.push(x.GPA)};

    if(x.YEAR==2018 && x.TERM==1) {term181.push(x.GPA)};
    if(x.YEAR==2018 && x.TERM==2) {term182.push(x.GPA)};
    if(x.YEAR==2018 && x.TERM==3) {term183.push(x.GPA)};

    if(x.YEAR==2019 && x.TERM==1) {term191.push(x.GPA)};
    if(x.YEAR==2019 && x.TERM==2) {term192.push(x.GPA)};
    if(x.YEAR==2019 && x.TERM==3) {term193.push(x.GPA)};
});
let data = {
    y16:[arrAvg(term161), arrAvg(term162),arrAvg(term163)],
    y17:[arrAvg(term171), arrAvg(term172),arrAvg(term173)],
    y18:[arrAvg(term181), arrAvg(term182),arrAvg(term183)],
    y19:[arrAvg(term191), arrAvg(term192),arrAvg(term193)]
}

console.log(data);
export default data;