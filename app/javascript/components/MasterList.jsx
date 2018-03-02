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
      return (<tr key={`key-${val.name}`}>
        <td> {val.name}</td>
        <td>{val.value}</td>
      </tr>)
    })
  }
  render() {
    return (
        <div>
          <table className="table table-bordered ">
            <thead>
              <tr>
                <th>Name</th>
                <th>Value</th>
              </tr>

            </thead>
            <tbody>
              {this.renderList()}
            </tbody>
          </table>
        </div>
    )
  }
}

export default MasterList
