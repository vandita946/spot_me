// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initChatroomCable } from "../channels/chatroom_channel";
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();

  initChatroomCable();
});
$(document).on("click","#design",function(event){
  $('#new_goal_form').show();
  $('#blog_template').hide();
  $('#vacation_template').hide();
  $('#dating_template').hide();
  $('#marathon_template').hide();
  event.preventDefault();
});

$(document).on("click","#blog",function(event){
  $('#new_goal_form').hide();
  $('#blog_template').show();
  $('#vacation_template').hide();
  $('#dating_template').hide();
  $('#marathon_template').hide();
  event.preventDefault();
});

$(document).on("click","#vacation",function(event){
  $('#new_goal_form').hide();
  $('#blog_template').hide();
  $('#vacation_template').show();
  $('#dating_template').hide();
  $('#marathon_template').hide();
  event.preventDefault();
});

$(document).on("click","#dating",function(event){
  $('#new_goal_form').hide();
  $('#blog_template').hide();
  $('#vacation_template').hide();
  $('#dating_template').show();
  $('#marathon_template').hide();
  event.preventDefault();
});

$(document).on("click","#marathon",function(event){
  $('#new_goal_form').hide();
  $('#blog_template').hide();
  $('#vacation_template').hide();
  $('#dating_template').hide();
  $('#marathon_template').show();
  event.preventDefault();
});

// $(document).on("click","#milestone-0-submit",function(event){
//   $('#milestone-0-form').hide();
// });

// $(document).on("click","#milestone-1-submit",function(event){
//   $('#milestone-1-form').hide();
// });

// $(document).on("click","#milestone-2-submit",function(event){
//   $('#milestone-2-form').hide();
// });

$(document).on("click","#submit-all",function(event){
  $('#milestone-0-submit').click();
  $('#milestone-1-submit').click();
  $('#milestone-2-submit').click();
});

$(document).on("click","#milestone-0-remove",function(event){
  $('#milestone-0-form').remove();
});

$(document).on("click","#milestone-1-remove",function(event){
  $('#milestone-1-form').remove();
});

$(document).on("click","#milestone-2-remove",function(event){
  $('#milestone-2-form').remove();
});



// $(document).on("click","#create",function(event){
//   $('#milestones').show();
//   $('#goal_form').hide();
// });



// Server-to-client(s) pushes:
//  Broadcast in a model-specific channel:
//    ChatroomChannel.broadcast_to(@chatroom, data) in a channel folder for milestones
