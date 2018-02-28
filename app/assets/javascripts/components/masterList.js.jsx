
import _ from 'lodash'
var MasterList = React.createClass({
  propTypes: {
    greeting: React.PropTypes.string
  },

  constructor(props) {
    super(props);
    this.state = {
      prices: props.prices
    }
  }

  renderList: function (list) {

  }

  render: function() {
    return (
      <div class="table-responsive">
        <table class="table table-bordered table-striped table-responsive">
          {this.renderList}
        </table>
      </div>
    )
  }
});
//render rails view by syntax
// <%= react_component("HelloWorld", { greeting: "Hello" }) %>