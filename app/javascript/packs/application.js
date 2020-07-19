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
import { initModalVisitors } from "../channels/modal_visitor";
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();

  initChatroomCable();
  initModalVisitors();

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

$(document).on("click","#submit-all",function(event){
  $('#milestone-0-submit').click();
  $('#milestone-1-submit').click();
  $('#milestone-2-submit').click();
  $('#milestone-3-submit').click();
  $('#milestone-4-submit').click();
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

$(document).on("click","#milestone-3-remove",function(event){
  $('#milestone-3-form').remove();
});

$(document).on("click","#milestone-4-remove",function(event){
  $('#milestone-4-form').remove();
});

$(document).on("click","#add-another",function(event){
  $('#milestone-3-form').show();
  $('#milestone-4-form').show();
  $('#add-another').hide();
});

$(document).on("click",'#clipboard-btn',function(event){
  const link = document.getElementById("bar").innerText;
  navigator.clipboard.writeText(link);
  document.getElementById("clipboard-btn").innerText = "Copied!";
});

$(document).on("click",'#copy_link',function(event){
  const link = document.getElementById("invite_link").innerText;
  navigator.clipboard.writeText(link);
  document.getElementById("copy_link").innerText = "Copied!";
});


// Server-to-client(s) pushes:
//  Broadcast in a model-specific channel:
//    ChatroomChannel.broadcast_to(@chatroom, data) in a channel folder for milestones
