#= require jquery
#= require json2
#= require underscore
#= require backbone
#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./routers


window.App =
  Models: {}
  Collections: {}
  Views: {}
  Routers:{}

$ ->
  window.router = new App.Routers.Cisco()
  Backbone.history.start();