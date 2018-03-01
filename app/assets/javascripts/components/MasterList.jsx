
import _ from 'lodash'
var MasterList = React.createClass({
  propTypes: {
    prices: React.PropTypes.array
  },
  getInitialState: function() {
    return { message: this.props.prices};
  },

  // constructor(props) {
  //   super(props);
  //   this.state = {
  //     prices: props.prices
  //   }
  // },

  renderList: function () {
    const list= _.cloneDeep(this.state.prices)
    return _.map(list, (val) => {
      return (<tr>
        <td> {val.name}</td>
        <td>{val.value}</td>
      </tr>)
    })
  },

  render: function() {
    return (
      <div class="table-responsive">
        <table class="table table-bordered table-striped table-responsive">
          {this.renderList()}
        </table>
      </div>
    )
  }
});