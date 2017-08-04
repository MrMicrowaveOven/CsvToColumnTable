# CSV to Columned Table

The challenge: Given a CSV and the number of desired columns, convert it to a transposed table.

The strange bit: Use an MVC structure.

Well to be honest, the MVC structure seems like a bit of overkill.  Most of the work will be in the display whether I like it or not (lots of `append`ing I'm sure).  Nevertheless, the simplest way to throw together an MVC is in Rails, so might as well go full-stack with this one.

## Model

Simple Rails model.  Since there will be no need for a database, and since the Table will be a singleton, I elected to make the functionality through a Class Method.  No need to create an instance of a Table every time, since we only ever need one.

I threw in a test for the make_table method, since I knew testing it from the front-end would get tedious.  This made the process much faster in the long run, since it was easier to spot my mistakes quickly.

## Controller

Doesn't do much in this case.

### New

Serves the `new.html` view by default.

### Create

Takes the inputs (csv and number of columns), and calls the `make_table` method on the Table model.  Serves the response to the view.  Super skinny, which is how it should be.

## View

Either .erb or .html.  I generally prefer .html, since front-end libraries can occasionally get weird with .erb.  In addition, there was only going to be one page, so the controller rendering with .erb could get confusing.  So html it is!

Throw the inputs on there with a blank table, set the submit button to an AJAX call, and voila!  We have an ugly table!

Validations were easy-peasy.  The only inputs that won't work are:
* An input with 0 values: just disable the button
* An input with over 100 values: just disable the button
* An input with just commas: show an error message

The first two are handled on the front-end, but that last one is a bit tough.  The Model will return an empty array, which could make the table display functionality freak out.  So I did a final check before displaying the table to make sure the array had something in it.

To be honest, I'm not sure how the app should react if it's given just commas.  Should it treat the empty space between commas as a value?  This wasn't really specified.  I'm thinking for the MVP we'll just ignore commas in a row.

# Making the Front-End Shiny

I was hoping to get a chance to throw bootstrap.js into the front-end, since plain old html DOM elements are ugly as sin.  I sorta got it to work when I ran out of time, even though the table looks a little wonky (why do the column headers have a semi-transparent border?).

# If I had more time, I would...

* Show an error message if the submit button is disabled, so the user knows how to enable the button.
* Fix the table column headers.
* Move some of the validation into the model, where it belongs.
* Move the JS to its rightful place, outside of the html file.  I don't even know why I put any JS into the new.html.  Gross habit.
