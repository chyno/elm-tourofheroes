'use strict';
require('ace-css/css/ace.css');
require('font-awesome/css/font-awesome.css');
require('./styles.css');
require('./styles/dashboard.component.css');
require('./styles/hero-detail.component.css');
require('./styles/hero-search.component.css');
require('./styles/heroes.component.css');
require('./styles/messages.component.css');

require('./index.html');

var Elm = require('./src/Main.elm');
var mountNode = document.getElementById('main');

// The third value on embed are the initial values for incomming ports into Elm
var app = Elm.Main.embed(mountNode);