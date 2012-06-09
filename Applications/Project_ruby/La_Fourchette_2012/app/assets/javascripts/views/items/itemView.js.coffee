
class App.Views.ItemView extends Backbone.View

  className: 'item'
  
  template: JST["templates/items/item"]
  
  initialize: ->
    #@model.on('change', @render, @)
      
  render: -> 
      $(@el).html @template @model.toJSON()
      @
      