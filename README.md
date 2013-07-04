Jekyll Category Pagination
==========================

This jekyll plugin enables separate categories to be paginated.

*It appears that Jekyll v1.0 already has this feature and this plugin is
deprecated.*

Installation
------------

Place the `category_pagination.rb` file into the `_plugins` directory of your
Jekyll site.  If the directory does not exist, create it.

Usage
-----

Create a directory with the name of your category.  Then create an index page
inside of this directory.

As example, lets say you have two categories that you want paginated, **Art**
for posts related to artwork and **Technology** for techy blog posts.  To
paginate these topics, create folders with your categories' names in your site's
source folder and respective index pages for them.  The site's source folder for
this example should look something similar to this:

    |- Site/
    | |- Art/
    | | |- _posts/
    | | |- index.html
    | |- Technology/
    | | |- _posts/
    | | |- index.html

The paginator will create a `page2/index.html`, `page3/index.html`, etc as
needed in your cagegory folder.  As you might exepect, the paginated pages will
only contain posts that belong to the category specified by the folder name.

    |- Site/
    | |- Art/
    | | |- index.html
    | | |- page2/
    | | | |- index.html
    | | |- page3/
    | | | |- index.html
    | |- Technology/
    | | |- index.html
    | | |- page2/
    | | | |- index.html

If you want to paginate with all posts (the default behavior), just create an
index page at the root of your site, or put the index page in a folder that
doesn't match a category name.

Contributing
------------

Feel free to fork this project, send me pull requests, and issues through [the
project's github page][project-page].

[project-page]: https://github.com/MrWerewolf/jekyll-category-pagination
