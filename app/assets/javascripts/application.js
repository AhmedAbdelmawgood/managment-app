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
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .
$(document).on('page:load',function(){
	$("td:contains('false')").html('').addClass('false');
	$("td:contains('true')").html('').addClass('true');	
});
$(function(){
	$("td:contains('false')").html('').addClass('false');
	$("td:contains('true')").html('').addClass('true');	

})
$(function(){
	$("td.accom").on('click', function(e){
		id = $(this).data('id');
		var elem = this
 		$.ajax({
			url:'/task-toggling',
			type:'post',
			data:{id: id},
			success:function (data) { $(elem).toggleClass('false true')},
			error: function(){
				$(this).html("May be another time");
			}

		})
	});
})