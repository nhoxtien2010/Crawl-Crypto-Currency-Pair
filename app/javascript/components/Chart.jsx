
import React from "react";
import PropTypes from "prop-types";

import { scaleTime } from "d3-scale";
import { utcMinute } from "d3-time";

import { ChartCanvas, Chart } from "react-stockcharts";
import { CandlestickSeries } from "react-stockcharts/lib/series";
import { XAxis, YAxis } from "react-stockcharts/lib/axes";
import { fitWidth } from "react-stockcharts/lib/helper";
import { last, timeIntervalBarWidth } from "react-stockcharts/lib/utils";
import { timeParse } from "d3-time-format";
import _ from 'lodash'

function parseData(parse,d) {
    d.date = parse(d.date);
    return d;
}

const parseDate = timeParse("%Y-%m-%dT%H:%M:%S.%LZ");

class CandleStickChart extends React.Component {
    render() {
        const { type, width, data, ratio } = this.props;

        let renderData  = _.map( data, (d) => parseData(parseDate,d))
        const xAccessor = d => d.date;
        const xExtents = [
            xAccessor(last(renderData)),
            xAccessor(renderData[renderData.length - 100])
        ];
        return (
            <ChartCanvas height={400}
                         ratio={ratio}
                         width={width}
                         margin={{ left: 50, right: 50, top: 10, bottom: 30 }}
                         type={type}
                         seriesName="MSFT"
                         data={renderData}
                         xAccessor={xAccessor}
                         xScale={scaleTime()}
                         xExtents={xExtents}>

                <Chart id={1} yExtents={d => [d.high, d.low]}>
                    <XAxis axisAt="bottom" orient="bottom" ticks={6}/>
                    <YAxis axisAt="left" orient="left" ticks={5} />
                    <CandlestickSeries width={timeIntervalBarWidth(utcMinute)}/>
                </Chart>
            </ChartCanvas>
        );
    }
}

CandleStickChart.propTypes = {
    data: PropTypes.array.isRequired,
    width: PropTypes.number.isRequired,
    ratio: PropTypes.number.isRequired,
    type: PropTypes.oneOf(["svg", "hybrid"]).isRequired,
};

CandleStickChart.defaultProps = {
    type: "svg",
};
CandleStickChart = fitWidth(CandleStickChart);

export default CandleStickChart;
