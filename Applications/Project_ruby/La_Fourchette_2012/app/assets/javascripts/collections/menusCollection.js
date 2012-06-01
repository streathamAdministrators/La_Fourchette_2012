/**
 * @author damienh
 */
 
(function() {
  window.App.Collections.menusCollection = Backbone.Collection.extend({
    model: window.App.Models.menuModel,
    url: '/ready'
  });
}).call(this);