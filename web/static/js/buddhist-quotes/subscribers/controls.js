import React from "react";
import { Button, ButtonToolbar, Glyphicon } from "react-bootstrap";
import { hashHistory } from "react-router";

class SubscribersControls extends React.Component {

  constructor(props) {
    super(props);
  }

  handleAdd() {
    hashHistory.push("/subscribers/new");
  }

  render() {
    return (<ButtonToolbar>
      <Button bsStyle="primary" onClick={this.handleAdd}>
        <Glyphicon glyph="plus" />
        Add Subscriber
      </Button>
    </ButtonToolbar>);
  }
}

export default SubscribersControls
