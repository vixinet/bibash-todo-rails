# Training project

This project aims at going through all rails specificities through a step by step project. Each steps increments in complexitiy.

## Area to discover
- [x] bundle cli
- [x] rails cli
- [x] rails console
- [x] rails server
- [x] Github basics
- [x] Controllers
- [x] Models
- [x] Migrations
- [x] Views
- [x] Partials
- [x] Helpers
- [x] Routing
- [ ] Tasks
- [x] Mailers
- [ ] Device
- [ ] Filtering data
- [ ] Slug (to_param, to_slug)
- [x] Class methods
- [x] Object methods
- [x] TDD
- [x] Validations
- [x] relations belongs_to
- [ ] relations has_one
- [x] relations has_many
- [x] relations has_and_belongs_to_many
- [x] relation through
- [x] Assets pipeline
- [ ] CRF tokens
- [x] Data query (.all, .where, .where.not, .order, etc)
- [ ] STI
- [ ] Shallow routing
- [x] Destroy cascade
- [ ] Destroy nullify

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
1. Add the class method `total` to `Project` in order to get `Project.total` returning the amount of projects in the data base
1. Add the class method `total` to `Todo` in order to get `Todo.total` returning the amount of todos in the data base
1. The sentence `We currently have n todos within n projects` to the home page. Both `n` should refer to the newly created class methods and `todos` and `projects` should plurialize according to the amount.
1. Do training (1) listed below if you need a refresh of the points we went trough.
1. Scaffold a resource `Task` with fields `done` as a `boolean`, `label` as a `string`, `todo` as a reference
1. Test `label` is present
1. Test `label` is unique through the `Todo`
1. Test `todo` is required
1. Test `done` is `false` at creation
1. Test `Task` gets deleted when we delete parent `Todo`
1. Test `project` exists (has_one through)
1. Test `Task` gets deleted when we delete parent `Project`
1. Generate a mailer `ProjectMailer` with `notify_admin` sending an email saying `New project NAME was created. Accese HERE` where NAME is the name of the project and HERE is a url to the project.
1. Call the mailer from `project#create` when the creation is a success
1. Add a method `open_tasks` to `Todo` returning  the current open tasks in it
1. Add a method `open_tasks` to `Todo` returning a `booblean` regarding if it still has open tasks
1. Change the `destroy` method of `todo` to raise an `StandardError` when we try to delete a `Todo` with open `tasks`
1. Add 3 images representing `:high`, `:medium`, `:low` priority
1. Display the image corresponding the `priority` of a `Todo` from the assets in the corresponding views
1. Move the code you just wrote to `todos_helper.rb`
1. Add a logo to the `public` folder and display it on every page

## Training (1)
1. Scaffold `Milestone` which as a `label`, a `deadline` and belongs to a `project`
1. All fields are required to create a `Milestone`
1. In a project the `show` view displays all milestones
1. Order them to see first the next in line (or past if one exists)
1. Add `status` attribute to a `Project` with the `enum` values `:open`, `:close`
1. The default status when creating a new project is `:open`
1. `milestone.active?` should return `true` if the project is `:open` or `false` if the project isn't `:open`
1. Scaffold `Label` ressource which has a `label`, and a `color`
1. Validate the `label` is present
1. Validate the `color` is in the format `#FFF` or `#FFFFFF`. `F` being an hecadecimal value `0-9A-Fa-F`
1. a `Label` can be part of many `projects` a `Project` can have many `labels` (use `has_and_belongs_to_many` relation)
1. Add a column `Labels` in the `index` view of `Projects` showing the amount of labels related to the `Project`
1. List all `labels` related to the `Project` in the `show` view of `Projects`
1. The background of a label cell should be the color defined in the label
1. List all `projects` related to the `Label` in the `show` view of `Labels`
1. The route `/labels` should not be accessible anymore
1. Remove the field `description` from the project in the interface and the database
1. The Project field `status` must be editable through the `create` and `edit` forms
1. Display the Project's `rating` in the `show` view
