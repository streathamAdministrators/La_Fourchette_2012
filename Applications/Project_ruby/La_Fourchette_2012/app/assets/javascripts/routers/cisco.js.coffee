
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
      success: @Sync_Items

      
   
        
  final: ->
    alert "final post"
  
  Sync_Items: (Items) ->
    @choiceCollectionView = new App.Views.ItemsCollectionView
        collection: Items
    @choiceCollectionView.render()
    $('#mainapp').html @choiceCollectionView.el
    
  successFetch: (data) ->
    alert "success : #{data}"
   
  errorFetch: (data) ->
    alert "error : #{data}"
  
  resolveView: (view) ->
    view.render()
    $('#mainapp').html view.el
    
