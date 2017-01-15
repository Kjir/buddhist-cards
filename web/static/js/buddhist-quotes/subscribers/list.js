import React from "react";
import axios from "axios";
import { Table } from "react-bootstrap";
import SubscribersControls from "./controls";

function SubscribersList(props) {
  return (
    <div>
      <SubscribersTable />
      <SubscribersControls />
    </div>);
}

class SubscribersTable extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      subscribers: []
    };
  }

  componentDidMount() {
    axios.get('/api/v1/subscribers').then((response) => {
      this.setState({ subscribers: response.data.subscribers});
    });
  }

  render() {
    return (<Table striped hover bordered>
      <thead>
        <tr>
          <th>First name</th>
          <th>Last name</th>
        </tr>
      </thead>
      <tbody>
        { this.tableRows() }
      </tbody>
    </Table>);
  }

  tableRows() {
    return this.state.subscribers.map((subscriber, index) =>
      <SubscriberRow key={index} subscriber={subscriber} />
    );
  }
}

function SubscriberRow(props) {
  return (<tr>
    <td>{props.subscriber.first_name}</td>
    <td>{props.subscriber.last_name}</td>
  </tr>);
}

export default SubscribersList
