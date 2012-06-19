
class App.Views.ChoiceView extends Backbone.View

  id: 'choice'
  
  template: JST["templates/choice"]
  
  events:
      "click #choice-1"  : "navigateMeals"
      "click #choice-2"  : "navigateItems"
      "click #choice-3" : "navigateDrinks"
      
      
  render: -> 
      $(@el).html @template
      @
    
  navigateMeals: ->
      window.router.navigate("/meals", {trigger:true})
      
  navigateItems: -> 
      window.router.navigate("/items", {trigger:true})

  navigateDrinks: ->
      window.router.navigate("/drinks", {trigger:true})




