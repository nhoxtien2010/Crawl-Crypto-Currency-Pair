
import React from 'react';
import Chart from './Chart';

import { TypeChooser } from "react-stockcharts/lib/helper";


class ChartContainer extends React.Component {
    // constructor (props) {
    //     super(props)
    //     this.state = {
    //         data: props.data
    //     }
    // }
    componentDidMount() {
        this.setState({ data: this.props.data})
    }
    render() {
        if (this.state == null) {
            return <div>Loading...</div>
        }
        return (
            <TypeChooser>
                {type => <Chart type={type} data={this.state.data} />}
            </TypeChooser>
        )
    }
}


export default ChartContainer;