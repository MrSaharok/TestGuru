require("@popperjs/core")

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap'
import { Tooltip, Popover } from "bootstrap"
import 'bootstrap-icons/font/bootstrap-icons.css'
import 'jquery'
import '../utilities/sorting'
import '../utilities/password'
import '../utilities/form_inline'
import '../utilities/progressBar'

// The stylesheet location we created earlier
require("../stylesheets/application.css")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// If you're using Turbolinks. Otherwise simply use: jQuery(function () {
document.addEventListener("turbolinks:load", () => {
    // Both of these are from the Bootstrap 5 docs
    let tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    let tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
        return new Tooltip(tooltipTriggerEl)
    })

    let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
    let popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
        return new Popover(popoverTriggerEl)
    })
})
