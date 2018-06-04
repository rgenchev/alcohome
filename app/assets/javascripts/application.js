// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require popper
//= require typed.js/lib/typed
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .


window.onload = function() {
	if (sessionStorage.getItem("age_check") == null) {
		sessionStorage.setItem("age_check","false");
	}

	if (history.length == 1) {
		sessionStorage.setItem("age_check","true");
	}

	if (sessionStorage.getItem("age_check") == 'false') {
	    $('#myModal').modal({backdrop: 'static', keyboard: false, show: true});
	}
}

function confirmAge() {
	sessionStorage.setItem("age_check","true");
};
