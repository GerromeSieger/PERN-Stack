/* eslint "arrow-body-style": off, "react/prop-types": off,
 "no-restricted-syntax": off, "prefer-const": off */

import React, { Component } from "react";
import axios from 'axios';
import { connect } from "react-redux";
import { addUser } from "store/actions/index";

import Button from "components/CustomButtons/Button.js";

const mapDispatchToProps = (dispatch) => {
  return {
    addUser: user => dispatch(addUser(user))
  };
};

const mapStateToProps = (state) => {
  return { users: state.users };
};

class ConnectedLoadBtn extends Component {
  constructor(props) {
    super(props);
    this.state = {
      loaded: false
    };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    axios.get('http://victorifah.20.84.39.184.nip.io/api/api/users/all')
      .then((response) => {
        console.log(response);
        response.data.forEach((user) => {
          for (let i of this.props.users) {
            if (user.id === i.id) return;
          }
          this.props.addUser(user);
        });
        this.setState({ loaded: true });
      })
      .catch((error) => {
        console.log(error);
      });
  }

  render() {
    return (
      <Button
        color="success"
        onClick={this.handleClick}
        disabled={this.state.loaded}
      >
        Load Users
      </Button>
    );
  }
}

const LoadBtn = connect(mapStateToProps, mapDispatchToProps)(ConnectedLoadBtn);

export default LoadBtn;
