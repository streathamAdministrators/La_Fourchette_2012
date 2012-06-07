
class App.Views.ChoiceView extends Backbone.View

  id: 'choice'
  
  template: JST["templates/choice"]
  
  events:
      "click #meals"  : "navigateMeals"
      "click #items"  : "navigateItems"
      "click #drinks" : "navigateDrinks"
      
  render: -> 
      $(@el).html @template
      @
    
  navigateMeals: ->
      alert "meals !"
      
  navigateItems: -> 
      alert "items !"

  navigateDrinks: ->
      alert "Ca va trigger"
      window.router.navigate("/items", {trigger:true})
  
  
      



