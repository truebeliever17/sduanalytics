import gpa from '../../database/json/gpa.json';

let data = {l:0,m:0,h:0};

gpa.forEach((x) => {
    if (x.GPA>3) {
        data.h++;
    }
    if (x.GPA<1.67) {
        data.l++;
    }
    if (x.GPA>1.67 && x.GPA<3) {
        data.m++;
    }
})

export default data;