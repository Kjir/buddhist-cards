import React from "react";
import { Button, ButtonToolbar, Glyphicon } from "react-bootstrap";

function SubscribersControls(props) {
  return (<ButtonToolbar>
    <Button bsStyle="primary">
      <Glyphicon glyph="plus" />
      Add subscriber
    </Button>
  </ButtonToolbar>);
}

export default SubscribersControls
