/*global $, _, Backbone */
var app = app || {};
app.view = app.view || {};
app.router = app.router || {};
app.ajaxURL = "Documents/Head/mywebroot/";


//Define the main view here
app.PageView = Backbone.View.extend({
    
    el: null,
    
    initialize: function(options){
        
        this.el = options.el;
        this.$el.html("Hello world");
        
    },
    
    loadPage: function(url){
        var template;
        console.log(url);
        $.get(url, function(data){
            template = _.template(data, {});
            this.$el.html(template)
        }.bind(this), 'html')
        
        
    }
    
})


app.MainRouter = Backbone.Router.extend({
  
  routes: {
      ':one': 'one',
      ':one/:two': 'two',
      '': 'default',
      
      
      
  },
  one: function(first){
    app.View.loadPage(first);  
  }, 
  two: function(first, second){
    app.View.loadPage(first + '/' + second);   
  },
  default: function(pathName){
      app.View.loadPage('home.html');
  }
    
    
})

$(function(){
    
   
    app.View = new app.PageView({
        el: "#pageContent"
    })
    app.Router = new app.MainRouter();
    Backbone.history.start({
        });
    
})
