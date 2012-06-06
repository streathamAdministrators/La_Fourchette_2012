
class App.Views.ItemView extends Backbone.View

  className: 'item'
  
  template: JST["templates/item"]
      
  render: -> 
      $(@el).html @template
        model: @model.toJSON()
      @
  
      