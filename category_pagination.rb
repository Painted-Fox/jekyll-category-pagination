# Jekyll category pagination.
# https://github.com/MrWerewolf/jekyll-category-pagination
#
# Copyright (c) 2012 Ryan Seto <mr.werewolf@gmail.com>
# Licensed under the MIT license (http://www.opensource.org/licenses/mit-license.php)
#
# Place this script into the _plugins directory of your Jekyll site.
#
module Jekyll
  class Page
    # We need access to the page's directory.  It's write only by default.
    attr_accessor :dir
  end

  class Pagination < Generator
    # This generator is safe from arbitrary code execution.
    safe true

    # Paginates the blog's posts. Renders the index.html file into paginated
    # directories, e.g.: page2/index.html, page3/index.html, etc and adds more
    # site-wide data.
    #
    # site - The Site.
    # page - The index.html Page that requires pagination.
    #
    # {"paginator" => { "page" => <Number>,
    #                   "per_page" => <Number>,
    #                   "posts" => [<Post>],
    #                   "total_posts" => <Number>,
    #                   "total_pages" => <Number>,
    #                   "previous_page" => <Number>,
    #                   "next_page" => <Number> }}
    def paginate(site, page)
      category = page.dir.split('/').last
      if category != nil and site.site_payload['site']['categories'].has_key? category
        # If we're in a category's folder, paginate by category.
        all_posts = site.site_payload['site']['categories'][category]
      else
        all_posts = site.site_payload['site']['posts']
      end

      pages = Pager.calculate_pages(all_posts, site.config['paginate'].to_i)
      (1..pages).each do |num_page|
        pager = Pager.new(site.config, num_page, all_posts, pages)
        if num_page > 1
          newpage = Page.new(site, site.source, page.dir, page.name)
          newpage.pager = pager
          newpage.dir = File.join(page.dir, "page#{num_page}")
          site.pages << newpage
        else
          page.pager = pager
        end
      end
    end
  end
end