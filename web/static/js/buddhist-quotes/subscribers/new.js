import React from "react";
import { Button, ControlLabel, FormControl, FormGroup } from "react-bootstrap";
import axios from "axios";
import { hashHistory } from "react-router";

class NewSubscriber extends React.Component {
  constructor(props) {
    super(props);
    this.states = {'first_name': null, 'last_name': null};

    this.submitHandler = this.submitHandler.bind(this);
    this.handleFirstNameChange = this.handleFirstNameChange.bind(this);
    this.handleLastNameChange = this.handleLastNameChange.bind(this);
  }

  handleFirstNameChange(event) {
    this.setState({'first_name': event.target.value});
  }

  handleLastNameChange(event) {
    this.setState({'last_name': event.target.value});
  }

  render() {
    return (<form onSubmit={this.submitHandler}>
      <FormGroup controlId="first_name">
        <ControlLabel>First name</ControlLabel>
        <FormControl onChange={this.handleFirstNameChange} />
      </FormGroup>
      <FormGroup controlId="last_name">
        <ControlLabel>Last name</ControlLabel>
        <FormControl onChange={this.handleLastNameChange} />
      </FormGroup>
      <Button type="submit" bsStyle="primary" block>Add Subscriber</Button>
    </form>);
  }

  submitHandler(event) {
    event.preventDefault();
    axios.post("/api/v1/subscribers", { subscriber: this.state }).then(() => {
      hashHistory.push("/subscribers");
    });
  }
}

export default NewSubscriber;
