import { mount, render, shallow } from 'enzyme';
import SubscribersControls from './controls';
import React from 'react';
import { Glyphicon } from "react-bootstrap";
import { hashHistory } from "react-router";

describe('SubscribersControls', () => {
  it('renders a button', () => {
    const controls = mount(<SubscribersControls />);
    expect(controls.find('.btn').length).toEqual(1);
  });

  it('has the correct label', () => {
    const controls = render(<SubscribersControls />);
    expect(controls.text()).toEqual('Add Subscriber');
  });

  it('has a plus icon', () => {
    const controls = shallow(<SubscribersControls />);
    expect(controls.contains(<Glyphicon glyph="plus" />)).toEqual(true);
  });

  it('opens the new subscriber form when clicked', () => {
    hashHistory.push = jest.fn();
    const controls = shallow(<SubscribersControls />);
    controls.find('Button').simulate('click');
    expect(hashHistory.push).toBeCalledWith('/subscribers/new');
  });
});
