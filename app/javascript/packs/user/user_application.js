// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "bootstrap"
import "@fortawesome/fontawesome-free/js/all"
import $ from 'jquery'
window.jQuery = $;
window.$ = $;
require("@nathanvda/cocoon")
require('admin-lte');
require("datatables.net-buttons-bs4");
require('datatables.net-responsive-bs4');
require('datatables.net-bs4');
import Swal from 'sweetalert2/dist/sweetalert2.js'
window.Swal = Swal

// scss
import "../../stylesheets/user/user_application"
import "../../stylesheets/user/sidebar"

// custom js
import "./main"

Rails.start()
// Turbolinks.start()
ActiveStorage.start()
