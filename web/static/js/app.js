// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"
import React from "react"
import ReactDOM from "react-dom"
import { hashHistory, IndexRoute, Route, Router } from "react-router"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
import App from "./buddhist-quotes"
import NewSubscriber from "./buddhist-quotes/subscribers/new"
import SubscribersList from "./buddhist-quotes/subscribers/list"

ReactDOM.render(
  <div>
    <Router history={hashHistory}>
      <Route path="/" component={App}>
        <IndexRoute component={SubscribersList} />
        <Route path="/subscribers" component={SubscribersList} />
        <Route path="/subscribers/new" component={NewSubscriber} />
      </Route>
    </Router>
  </div>,
  document.getElementById("buddhist-quotes")
)
