
class App.Views.MealsCollectionView extends Backbone.View

  id: 'meals'
  current_meals_id:0
  
  initialize: ->
    
    @collection.on('add', @addMeal, @);
    @collection.on('reset', @render, @);
  
  addMeal: (mealModel) ->
      mealView = new App.Views.MealView
        model: mealModel
      
      @$el.append mealView.render().el
      
      
      
      
      
  render: ->
    @collection.forEach(@addMeal, @)
    @

  
      



