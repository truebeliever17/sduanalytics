import d from '../../database/json/testJson.js'

export const scatter={
    type: 'scatter',
    data: {
        datasets: [{
            label: 'Scatter Dataset',
            data: d['datta']
        }]
    },
    options: {
        scales: {
            xAxes: [{
                type: 'linear',
                position: 'bottom'
            }]
        }
    }
}

export default scatter;