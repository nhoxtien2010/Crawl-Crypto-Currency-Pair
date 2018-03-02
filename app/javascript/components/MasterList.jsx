import React from "react"
import _ from 'lodash'
class MasterList extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      prices: props.prices
    }
  }
  renderList () {
    const list= _.cloneDeep(this.state.prices)
    return _.map(list, (val) => {
      return (<tr>
        <td> {val.name}</td>
        <td>{val.value}</td>
      </tr>)
    })
  }
  render() {
    return (
        <div class="table-responsive">
          <table class="table table-bordered table-striped table-responsive">
            {this.renderList()}
          </table>
        </div>
    )
  }
}

export default MasterList
