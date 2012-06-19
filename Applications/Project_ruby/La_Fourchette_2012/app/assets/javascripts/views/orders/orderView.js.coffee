
class App.Views.OrderView extends Backbone.View

  className: 'order appear'
    
  render: -> 
    
    @$el.append "<div id='items' class='order_item'></div>" if $('mainorder').find('#items').length is 0
    @$el.append "<div id='meals' class='order_meals'></div>" if $('mainorder').find('#meals').length is 0
       
    @model.mealslist?.forEach(@renderMeals, @)
    @model.itemslist?.forEach(@renderItems, @)
    @
  
  renderMeals: (item) ->
      itemView = new App.Views.ItemView
        model:item,
        template:JST["templates/orders/item"]
      
      $(@el).find('#items').append @itemView.render().el
      @
      
  renderItems: (meal) ->
    
     mealView = new App.Views.MealView
        model:meal,
        lazy: true,
        template:JST["templates/orders/meal"]
        
      $(@el).find('#meals').append @mealView.render().el
      @
    