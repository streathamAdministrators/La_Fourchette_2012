
class App.Views.ItemMealView extends Backbone.View

  tagName: 'li'
  template: JST["templates/items/itemMeal"]
      
  render: -> 
      $(@el).html @template @model.toJSON()
      @
      