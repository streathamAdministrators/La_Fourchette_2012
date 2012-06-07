
class App.Routers.Cisco extends Backbone.Router
  
  routes:
    "choice"      : "navChoice"
    "items"       : "navItems"
    ".*"            : "final"
  
  
  navChoice: -> 
    @choiceView = new App.Views.ChoiceView()
    @resolveView @choiceView
    
  navItems: ->
    @Items = new App.Collections.Items()
    @Items.fetch
      success:  ->
        @choiceCollectionView = new App.Views.ItemsCollectionView
          collection: @Items
        @resolveView @choiceCollectionView
  final: ->
    alert "final post"
        
    
  
  resolveView: (view) ->
    view.render()
    $('#mainapp').html view.el
    
