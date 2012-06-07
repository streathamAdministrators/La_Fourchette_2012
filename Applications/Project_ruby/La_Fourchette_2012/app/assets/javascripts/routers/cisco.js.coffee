
class App.Routers.Cisco extends Backbone.Router
  
  routes:
    "clients"      : "navChoice"
    "meals" : "navMeal"
    "items" : "navItems"
  
  
  navChoice: -> 
    @choiceView = new App.Views.ChoiceView()
    @resolveView @choiceView
  
    
  navMeal: ->
    @choiceView = new App.Views.ChoiceView()
    @resolveView @choiceView
    
  navItems: ->
    
  
  resolveView: (view) ->
    view.render()
    $('#mainapp').html(view.el);
    
