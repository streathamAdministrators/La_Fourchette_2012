
class App.Views.OrderView extends Backbone.View

  className: 'currentorder'
    
  render: -> 
    @model?.mealslist?.forEach(@renderMeals, @)
    @model?.itemslist?.forEach(@renderItems, @)
    @
  
  renderItems: (item) ->
      itemView = new App.Views.ItemView
        model:item,
        template:JST["templates/orders/item"]
      
      $(@el).find('#contentbill').append @itemView.render().el
      @
      
  renderMeals: (meal) ->
    
     mealView = new App.Views.MealView
        model:meal,
        lazy: true,
        template:JST["templates/orders/meal"]
        
      $(@el).find('#contentbill').append @mealView.render().el
      @