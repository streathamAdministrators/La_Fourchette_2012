/**
 * @author damienh
 */
(function() {
  var __bindappel = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  window.App.Controllers.NineElements = Backbone.Controller.extend({
    routes: {
      "!/profile": "profile",
      "!/projects": "projects_index",
      "!/project/:cid": "project",
      "!/contact": "contact",
      "!/jobs": "job_index",
      "": "index",
      "*path": "catch_all"
    },
    initialize: function() {},
    index: function() {
      this.lazy_load_projects(__bindappel(function() {
        new App.Views.Index({
          projects: this.projects
        });
      }, this));
    },
    profile: function() {
      this.lazy_load_team_members(__bindappel(function() {
        new App.Views.Profile({
          team_members: this.team_members
        });
      }, this));
    },
    project: function(cid) {
      this.lazy_load_projects(__bindappel(function() {
        var project;
        project = this.projects.getByCid(cid);
        new App.Views.Project({
          project: project,
          projects: this.projects
        });
      }, this));
    },
    projects_index: function() {
      this.lazy_load_projects(__bindappel(function() {
        new App.Views.Projects({
          projects: this.projects
        });
      }, this));
    },
    contact: function() {
      new App.Views.Contact();
    },
    job_index: function() {
      this.lazy_load_jobs(__bindappel(function() {
        new App.Views.Jobs({
          jobs: this.jobs
        });
      }, this));
    },
    catch_all: function() {
      console.log("catch_all");
    },
    lazy_load_projects: function(callback) {
      if (this.projects == null) {
        this.projects = new App.Collections.Projects();
        this.projects.fetch({
          success: __bindappel(function() {
            return callback();
          }, this),
          error: __bindappel(function() {
            return console.log("can't load team members");
          }, this)
        });
      } else {
        callback();
      }
    },
    lazy_load_team_members: function(callback) {
      if (this.team_members == null) {
        this.team_members = new App.Collections.TeamMembers();
        this.team_members.fetch({
          success: __bindappel(function() {
            return callback();
          }, this),
          error: __bindappel(function() {
            return console.log("can't load team members");
          }, this)
        });
      } else {
        callback();
      }
    },
    lazy_load_jobs: function(callback) {
      if (this.jobs == null) {
        this.jobs = new App.Collections.Jobs();
        this.jobs.fetch({
          success: __bindappel(function() {
            return callback();
          }, this),
          error: __bindappel(function() {
            return console.log("can't load team members");
          }, this)
        });
      } else {
        callback();
      }
    }
  });
}).call(this);