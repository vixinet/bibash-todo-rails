# Training project

This project aims at going through all rails specificities through a step by step project. Each steps increments in complexitiy.

## Area to discover
- [ ] bundle cli
- [ ] rails cli
- [ ] rails console
- [ ] rails server
- [ ] Github basics
- [ ] Controllers
- [ ] Models
- [ ] Migrations
- [ ] Views
- [ ] Partials
- [ ] Helpers
- [ ] Routing
- [ ] Tasks
- [ ] Mailers
- [ ] Device
- [ ] Filtering data
- [ ] Slug (to_param, to_slug)
- [ ] Class methods
- [ ] Object methods
- [ ] TDD
- [ ] Validations
- [ ] relations belongs_to
- [ ] relations has_one
- [ ] relations has_many
- [ ] relations has_and_belongs_to_many
- [ ] Assets pipeline
- [ ] Helpers
- [ ] CRF tokens
- [ ] Data query (.all, .where, .where.not, .order, etc)

## Taks
1. Create a new project `rails new`
1. Scaffold a resource `Project` with a `name` and a `description` as a `string`
1. Validates the presence of `name`
1. Generate a controller `StaticPages` with an action `home`
1. Change the content of the new action to `Welcome all`
1. Prevent the `destroy` action for `Project` model (through the routes)
1. Set `StaticPages#home` as the root of the web app
1. Add (manually) a new action to the `StaticPages` called `privacy` and accesible via `/privacy`
1. Add (manually) a new action to the `StaticPages` called `terms` and accesible via `/legal`
1. Add a route to access `StaticPages#terms` (Create on last step) via `/legal-terms`
1. Add (manually) a new action to the `StaticPages` called `location` and accesible via `/location`
1. Change the action `StaticPages#location` to render a view `map` when we try to access `/location?view=map`
1. Generate a migration adding the field `rating` as a `float` to the model `Project`
1. Add a validation to `Project` model to accept only `rating` values between `1` and `5` included.
1. Generate a model `Todo` with a `label` as a `string` and a `project` as a `references`
1. Look into the new model file to see what was generated
1. Look into the `schema` file and look what was generated
1. Validates the presence of `label`
1. Test within the rails console
1. **Pretend** to scaffold the controller
1. Find the right arguments to skip the existing model files
1. Add a `has_many` relation in `Project` to show all its related `Todo`
1. Restrict the access to `Todo#index` in the routing file
1. Display the `todos` of a `Project` in the `Project#index` endpoint
1. Generate a migration to add `priority` attribute to `Todo` as a `integer`
1. Declare this field as an `enum` in `Todo` model with the possible values of `:high`, `:medium`, `:low`
1. 




