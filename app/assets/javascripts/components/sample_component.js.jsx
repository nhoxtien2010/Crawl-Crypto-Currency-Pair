var SampleComponent = React.createClass({
  propTypes: {
    greeting: React.PropTypes.string
  },

  render: function() {
    return (
      <div>
        <div>Greeting: {this.props.greeting}</div>
      </div>
    );
  }
});
//render rails view by syntax
// <%= react_component("HelloWorld", { greeting: "Hello" }) %>