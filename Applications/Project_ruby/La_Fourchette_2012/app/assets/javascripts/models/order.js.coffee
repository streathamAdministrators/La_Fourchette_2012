
class App.Models.Order extends Backbone.Model
  paramRoot: 'order'

  defaults:
    tableid: 0
    itemslist: null
    mealslist: null
  
  initialize: ->
    
    @itemslist = new App.Collections.Items() if @itemslist?
    @mealslist = new App.Collections.Meals() if @mealslist?
    

  AddItem: (item) ->
    