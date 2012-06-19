
class App.Routers.Cisco extends Backbone.Router
  
  routes:
    "choice"      : "navChoice"
    "items"       : "navItems"
    "meals"       : "navMeals"
    "drinks"      : "navDrinks"
    
  
  initialize: ->
        _.extend(@, Backbone.Events)
        @on("render:fadeIn", @In)
        
        @orderView = new App.Views.OrderView
          model : window.order
        
        @resolveView @orderView, true
          
        
  navChoice: -> 
    @choiceView = new App.Views.ChoiceView()
    @resolveView @choiceView, false
    
  navItems: ->
    
    @Items = new App.Collections.Items()
    @Items.fetch
      success: @Sync_Items

  
  navMeals: ->
    
    @Meals = new App.Collections.Meals()
    @Meals.fetch
      success: @Sync_Meals
  
  navDrinks: ->
    @Items = new App.Collections.Items()
    @Items.url = '/drinks.json'
    @Items.fetch
      success: @Sync_Drinks

  Sync_Items: (Items) ->
    @itemsCollectionView = new App.Views.ItemsCollectionView
        collection: Items
    @itemsCollectionView.render()
    $('#content').html @itemsCollectionView.el
    
  Sync_Meals: (Meals) ->
    @mealsCollectionView = new App.Views.MealsCollectionView
        collection: Meals
    @mealsCollectionView.render()
    $('#content').html @mealsCollectionView.el
    
  
  Sync_Drinks: (Items) ->
    @itemsCollectionView = new App.Views.ItemsCollectionView
        collection: Items
    @itemsCollectionView.render()
    $('#content').html @itemsCollectionView.el
    
  resolveView: (view, sidebar) ->
    view.render()
    container = $('#content')
    container = $('#sidebar-container') if sidebar is true
    
    container.css("display", "none")
    container.html view.el
    @trigger "render:fadeIn"

  In: ->
    $('#content').fadeIn 1000
    
