
class App.Models.Order extends Backbone.Model
  paramRoot: 'order'

  defaults:
    tableid: 0
    itemslist: null
    mealslist: null
    totalprice: 0.0
  
  initialize: ->
    @itemslist = new App.Collections.Items() if @itemslist?
    @mealslist = new App.Collections.Meals() if @mealslist?
    

  additem: (item) ->
    @itemslist.add(item)
    @
  
  addmeals: (meal) ->
    @mealslist.add(meal)
    @
    
    
    