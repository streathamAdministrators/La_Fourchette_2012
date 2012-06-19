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
  window.order = new App.Models.Order
    tableid: window.location.pathname.substring(window.location.pathname.lastIndexOf('/') + 1)
    
  window.command = new App.Models.Comand()
  Backbone.history.start()
