  


<!DOCTYPE html>
<html>
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# githubog: http://ogp.me/ns/fb/githubog#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>puppet/lib/puppet/provider/zpool/zpool.rb at master · puppetlabs/puppet · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png" />
    <link rel="logo" type="image/svg" href="http://github-media-downloads.s3.amazonaws.com/github-logo.svg" />
    <link rel="xhr-socket" href="/_sockets" />


    <meta name="msapplication-TileImage" content="/windows-tile.png" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="selected-link" value="repo_source" data-pjax-transient />
    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="github" name="octolytics-app-id" />

    
    
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />

    <meta content="authenticity_token" name="csrf-param" />
<meta content="Su96dQCoQ1cMfpZdpj3k1ZW+peumoBo0nq2yHhg+R0w=" name="csrf-token" />

    <link href="https://a248.e.akamai.net/assets.github.com/assets/github-64354b3684a175db223715fcd6748b0daf8aebbc.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://a248.e.akamai.net/assets.github.com/assets/github2-883c2d036f95a0fb486a5d977a84cb0b91a58353.css" media="all" rel="stylesheet" type="text/css" />
    


      <script src="https://a248.e.akamai.net/assets.github.com/assets/frameworks-92d138f450f2960501e28397a2f63b0f100590f0.js" type="text/javascript"></script>
      <script src="https://a248.e.akamai.net/assets.github.com/assets/github-af722d045ae48a4eaa88da3a9a035a24422643e0.js" type="text/javascript"></script>
      
      <meta http-equiv="x-pjax-version" content="ab8d8f64c5a45a6c9a740db2c4071f6b">

        <link data-pjax-transient rel='permalink' href='/puppetlabs/puppet/blob/2dd097c08d6e2675526488e9196798cf4bfdad96/lib/puppet/provider/zpool/zpool.rb'>
    <meta property="og:title" content="puppet"/>
    <meta property="og:type" content="githubog:gitrepository"/>
    <meta property="og:url" content="https://github.com/puppetlabs/puppet"/>
    <meta property="og:image" content="https://secure.gravatar.com/avatar/eb454c2139c156db7c8266a875519a1f?s=420&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"/>
    <meta property="og:site_name" content="GitHub"/>
    <meta property="og:description" content="puppet - Server automation framework and application"/>
    <meta property="twitter:card" content="summary"/>
    <meta property="twitter:site" content="@GitHub">
    <meta property="twitter:title" content="puppetlabs/puppet"/>

    <meta name="description" content="puppet - Server automation framework and application" />


    <meta content="234268" name="octolytics-dimension-user_id" /><meta content="910744" name="octolytics-dimension-repository_id" />
  <link href="https://github.com/puppetlabs/puppet/commits/master.atom" rel="alternate" title="Recent Commits to puppet:master" type="application/atom+xml" />

  </head>


  <body class="logged_out page-blob  vis-public env-production  ">
    <div id="wrapper">

      

      
      
      

      
      <div class="header header-logged-out">
  <div class="container clearfix">

    <a class="header-logo-wordmark" href="https://github.com/">Github</a>

    <div class="header-actions">
      <a class="button primary" href="https://github.com/signup">Sign up</a>
      <a class="button" href="https://github.com/login?return_to=%2Fpuppetlabs%2Fpuppet%2Fblob%2Fmaster%2Flib%2Fpuppet%2Fprovider%2Fzpool%2Fzpool.rb">Sign in</a>
    </div>

    <div class="command-bar js-command-bar  in-repository">


      <ul class="top-nav">
          <li class="explore"><a href="https://github.com/explore">Explore</a></li>
        <li class="features"><a href="https://github.com/features">Features</a></li>
          <li class="blog"><a href="https://github.com/blog">Blog</a></li>
      </ul>
        <form accept-charset="UTF-8" action="/search" class="command-bar-form" id="top_search_form" method="get">
  <a href="/search/advanced" class="advanced-search-icon tooltipped downwards command-bar-search" id="advanced_search" title="Advanced search"><span class="octicon octicon-gear "></span></a>

  <input type="text" data-hotkey="/ s" name="q" id="js-command-bar-field" placeholder="Search or type a command" tabindex="1" autocapitalize="off"
    
      data-repo="puppetlabs/puppet"
      data-branch="master"
      data-sha="140ebb565e9027e8af8782b078b22aecf466e5c2"
  >

    <input type="hidden" name="nwo" value="puppetlabs/puppet" />

    <div class="select-menu js-menu-container js-select-menu search-context-select-menu">
      <span class="minibutton select-menu-button js-menu-target">
        <span class="js-select-button">This repository</span>
      </span>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container">
        <div class="select-menu-modal">

          <div class="select-menu-item js-navigation-item selected">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" class="js-search-this-repository" name="search_target" value="repository" checked="checked" />
            <div class="select-menu-item-text js-select-button-text">This repository</div>
          </div> <!-- /.select-menu-item -->

          <div class="select-menu-item js-navigation-item">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" name="search_target" value="global" />
            <div class="select-menu-item-text js-select-button-text">All repositories</div>
          </div> <!-- /.select-menu-item -->

        </div>
      </div>
    </div>

  <span class="octicon help tooltipped downwards" title="Show command bar help">
    <span class="octicon octicon-question"></span>
  </span>


  <input type="hidden" name="ref" value="cmdform">

  <div class="divider-vertical"></div>

</form>
    </div>

  </div>
</div>


      

      


            <div class="site hfeed" itemscope itemtype="http://schema.org/WebPage">
      <div class="hentry">
        
        <div class="pagehead repohead instapaper_ignore readability-menu ">
          <div class="container">
            <div class="title-actions-bar">
              

<ul class="pagehead-actions">



    <li>
      <a href="/login?return_to=%2Fpuppetlabs%2Fpuppet"
        class="minibutton js-toggler-target star-button entice tooltipped upwards"
        title="You must be signed in to use this feature" rel="nofollow">
        <span class="octicon octicon-star"></span>Star
      </a>
      <a class="social-count js-social-count" href="/puppetlabs/puppet/stargazers">
        1,299
      </a>
    </li>
    <li>
      <a href="/login?return_to=%2Fpuppetlabs%2Fpuppet"
        class="minibutton js-toggler-target fork-button entice tooltipped upwards"
        title="You must be signed in to fork a repository" rel="nofollow">
        <span class="octicon octicon-git-branch"></span>Fork
      </a>
      <a href="/puppetlabs/puppet/network" class="social-count">
        562
      </a>
    </li>
</ul>

              <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
                <span class="repo-label"><span>public</span></span>
                <span class="mega-octicon octicon-repo"></span>
                <span class="author vcard">
                  <a href="/puppetlabs" class="url fn" itemprop="url" rel="author">
                  <span itemprop="title">puppetlabs</span>
                  </a></span> /
                <strong><a href="/puppetlabs/puppet" class="js-current-repository">puppet</a></strong>
              </h1>
            </div>

            
  <ul class="tabs">
    <li class="pulse-nav"><a href="/puppetlabs/puppet/pulse" class="js-selected-navigation-item " data-selected-links="pulse /puppetlabs/puppet/pulse" rel="nofollow"><span class="octicon octicon-pulse"></span></a></li>
    <li><a href="/puppetlabs/puppet" class="js-selected-navigation-item selected" data-selected-links="repo_source repo_downloads repo_commits repo_tags repo_branches /puppetlabs/puppet">Code</a></li>
    <li><a href="/puppetlabs/puppet/network" class="js-selected-navigation-item " data-selected-links="repo_network /puppetlabs/puppet/network">Network</a></li>
    <li><a href="/puppetlabs/puppet/pulls" class="js-selected-navigation-item " data-selected-links="repo_pulls /puppetlabs/puppet/pulls">Pull Requests <span class='counter'>12</span></a></li>




    <li><a href="/puppetlabs/puppet/graphs" class="js-selected-navigation-item " data-selected-links="repo_graphs repo_contributors /puppetlabs/puppet/graphs">Graphs</a></li>


  </ul>
  
<div class="tabnav">

  <span class="tabnav-right">
    <ul class="tabnav-tabs">
          <li><a href="/puppetlabs/puppet/tags" class="js-selected-navigation-item tabnav-tab" data-selected-links="repo_tags /puppetlabs/puppet/tags">Tags <span class="counter ">250</span></a></li>
    </ul>
  </span>

  <div class="tabnav-widget scope">


    <div class="select-menu js-menu-container js-select-menu js-branch-menu">
      <a class="minibutton select-menu-button js-menu-target" data-hotkey="w" data-ref="master">
        <span class="octicon octicon-branch"></span>
        <i>branch:</i>
        <span class="js-select-button">master</span>
      </a>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container">

        <div class="select-menu-modal">
          <div class="select-menu-header">
            <span class="select-menu-title">Switch branches/tags</span>
            <span class="octicon octicon-remove-close js-menu-close"></span>
          </div> <!-- /.select-menu-header -->

          <div class="select-menu-filters">
            <div class="select-menu-text-filter">
              <input type="text" id="commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
            </div>
            <div class="select-menu-tabs">
              <ul>
                <li class="select-menu-tab">
                  <a href="#" data-tab-filter="branches" class="js-select-menu-tab">Branches</a>
                </li>
                <li class="select-menu-tab">
                  <a href="#" data-tab-filter="tags" class="js-select-menu-tab">Tags</a>
                </li>
              </ul>
            </div><!-- /.select-menu-tabs -->
          </div><!-- /.select-menu-filters -->

          <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket css-truncate" data-tab-filter="branches">

            <div data-filterable-for="commitish-filter-field" data-filterable-type="substring">

                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.24.x/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.24.x" rel="nofollow" title="0.24.x">0.24.x</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.x/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.x" rel="nofollow" title="0.25.x">0.25.x</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.x/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.x" rel="nofollow" title="2.6.x">2.6.x</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.x/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.x" rel="nofollow" title="2.7.x">2.7.x</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.1.x/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.1.x" rel="nofollow" title="3.1.x">3.1.x</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/aix/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="aix" rel="nofollow" title="aix">aix</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item selected">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/master/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="master" rel="nofollow" title="master">master</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/stable/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="stable" rel="nofollow" title="stable">stable</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/ticket/master/13542_PMT_tarball_install/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="ticket/master/13542_PMT_tarball_install" rel="nofollow" title="ticket/master/13542_PMT_tarball_install">ticket/master/13542_PMT_tarball_install</a>
                </div> <!-- /.select-menu-item -->
            </div>

              <div class="select-menu-no-results">Nothing to show</div>
          </div> <!-- /.select-menu-list -->


          <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket css-truncate" data-tab-filter="tags">
            <div data-filterable-for="commitish-filter-field" data-filterable-type="substring">

                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/upstream/0.25.5/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="upstream/0.25.5" rel="nofollow" title="upstream/0.25.5">upstream/0.25.5</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/upstream/0.25.4/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="upstream/0.25.4" rel="nofollow" title="upstream/0.25.4">upstream/0.25.4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/upstream/0.25.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="upstream/0.25.0" rel="nofollow" title="upstream/0.25.0">upstream/0.25.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/upstream/0.24.8/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="upstream/0.24.8" rel="nofollow" title="upstream/0.24.8">upstream/0.24.8</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/tags/2.6.0rc3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="tags/2.6.0rc3" rel="nofollow" title="tags/2.6.0rc3">tags/2.6.0rc3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/tags/2.6.0rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="tags/2.6.0rc2" rel="nofollow" title="tags/2.6.0rc2">tags/2.6.0rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/tags/2.6.0rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="tags/2.6.0rc1" rel="nofollow" title="tags/2.6.0rc1">tags/2.6.0rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/release-0.9.2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="release-0.9.2" rel="nofollow" title="release-0.9.2">release-0.9.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/puppet-0.24.5-rc3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="puppet-0.24.5-rc3" rel="nofollow" title="puppet-0.24.5-rc3">puppet-0.24.5-rc3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/geordi-published-pe/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="geordi-published-pe" rel="nofollow" title="geordi-published-pe">geordi-published-pe</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/debian/2.6.2-4/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="debian/2.6.2-4" rel="nofollow" title="debian/2.6.2-4">debian/2.6.2-4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/debian/2.6.2-3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="debian/2.6.2-3" rel="nofollow" title="debian/2.6.2-3">debian/2.6.2-3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/debian/2.6.2-2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="debian/2.6.2-2" rel="nofollow" title="debian/2.6.2-2">debian/2.6.2-2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/debian/2.6.0-4/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="debian/2.6.0-4" rel="nofollow" title="debian/2.6.0-4">debian/2.6.0-4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/debian/2.6.0-3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="debian/2.6.0-3" rel="nofollow" title="debian/2.6.0-3">debian/2.6.0-3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/debian/2.6.0-2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="debian/2.6.0-2" rel="nofollow" title="debian/2.6.0-2">debian/2.6.0-2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/debian/2.6.0-1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="debian/2.6.0-1" rel="nofollow" title="debian/2.6.0-1">debian/2.6.0-1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/debian/0.25.5-1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="debian/0.25.5-1" rel="nofollow" title="debian/0.25.5-1">debian/0.25.5-1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/debian/0.25.4-6/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="debian/0.25.4-6" rel="nofollow" title="debian/0.25.4-6">debian/0.25.4-6</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/debian/0.25.4-4/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="debian/0.25.4-4" rel="nofollow" title="debian/0.25.4-4">debian/0.25.4-4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/debian/0.25.4-2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="debian/0.25.4-2" rel="nofollow" title="debian/0.25.4-2">debian/0.25.4-2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/debian/0.25.3-1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="debian/0.25.3-1" rel="nofollow" title="debian/0.25.3-1">debian/0.25.3-1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/debian/0.25.1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="debian/0.25.1" rel="nofollow" title="debian/0.25.1">debian/0.25.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-04-27-master/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-04-27-master" rel="nofollow" title="Iteration-2011-04-27-master">Iteration-2011-04-27-master</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-04-27-2.7.x/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-04-27-2.7.x" rel="nofollow" title="Iteration-2011-04-27-2.7.x">Iteration-2011-04-27-2.7.x</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-04-27-2.6.x/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-04-27-2.6.x" rel="nofollow" title="Iteration-2011-04-27-2.6.x">Iteration-2011-04-27-2.6.x</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-04-21-master/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-04-21-master" rel="nofollow" title="Iteration-2011-04-21-master">Iteration-2011-04-21-master</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-04-21-2.7.x/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-04-21-2.7.x" rel="nofollow" title="Iteration-2011-04-21-2.7.x">Iteration-2011-04-21-2.7.x</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-04-21-2.6.x/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-04-21-2.6.x" rel="nofollow" title="Iteration-2011-04-21-2.6.x">Iteration-2011-04-21-2.6.x</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-04-13-master/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-04-13-master" rel="nofollow" title="Iteration-2011-04-13-master">Iteration-2011-04-13-master</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-04-06-master/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-04-06-master" rel="nofollow" title="Iteration-2011-04-06-master">Iteration-2011-04-06-master</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-04-06-2.6.x/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-04-06-2.6.x" rel="nofollow" title="Iteration-2011-04-06-2.6.x">Iteration-2011-04-06-2.6.x</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-03-30-master/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-03-30-master" rel="nofollow" title="Iteration-2011-03-30-master">Iteration-2011-03-30-master</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-03-30-2.6.x/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-03-30-2.6.x" rel="nofollow" title="Iteration-2011-03-30-2.6.x">Iteration-2011-03-30-2.6.x</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-03-23-master/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-03-23-master" rel="nofollow" title="Iteration-2011-03-23-master">Iteration-2011-03-23-master</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-03-23-2.6.x/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-03-23-2.6.x" rel="nofollow" title="Iteration-2011-03-23-2.6.x">Iteration-2011-03-23-2.6.x</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-03-16-master/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-03-16-master" rel="nofollow" title="Iteration-2011-03-16-master">Iteration-2011-03-16-master</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-03-16-2.6.x/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-03-16-2.6.x" rel="nofollow" title="Iteration-2011-03-16-2.6.x">Iteration-2011-03-16-2.6.x</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-02-02-master/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-02-02-master" rel="nofollow" title="Iteration-2011-02-02-master">Iteration-2011-02-02-master</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-02-02-2.6.x/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-02-02-2.6.x" rel="nofollow" title="Iteration-2011-02-02-2.6.x">Iteration-2011-02-02-2.6.x</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-01-19-master/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-01-19-master" rel="nofollow" title="Iteration-2011-01-19-master">Iteration-2011-01-19-master</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-01-19-2.6.x/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-01-19-2.6.x" rel="nofollow" title="Iteration-2011-01-19-2.6.x">Iteration-2011-01-19-2.6.x</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-01-05-master/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-01-05-master" rel="nofollow" title="Iteration-2011-01-05-master">Iteration-2011-01-05-master</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2011-01-05-2.6.x/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2011-01-05-2.6.x" rel="nofollow" title="Iteration-2011-01-05-2.6.x">Iteration-2011-01-05-2.6.x</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2010-12-15-master/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2010-12-15-master" rel="nofollow" title="Iteration-2010-12-15-master">Iteration-2010-12-15-master</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2010-12-15-2.6.x/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2010-12-15-2.6.x" rel="nofollow" title="Iteration-2010-12-15-2.6.x">Iteration-2010-12-15-2.6.x</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2010-11-24/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2010-11-24" rel="nofollow" title="Iteration-2010-11-24">Iteration-2010-11-24</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2010-11-17/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2010-11-17" rel="nofollow" title="Iteration-2010-11-17">Iteration-2010-11-17</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2010-11-10/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2010-11-10" rel="nofollow" title="Iteration-2010-11-10">Iteration-2010-11-10</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Iteration-2010-11-03/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Iteration-2010-11-03" rel="nofollow" title="Iteration-2010-11-03">Iteration-2010-11-03</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/BetaOne/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="BetaOne" rel="nofollow" title="BetaOne">BetaOne</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/Beta1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="Beta1" rel="nofollow" title="Beta1">Beta1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.2.1-rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.2.1-rc1" rel="nofollow" title="3.2.1-rc1">3.2.1-rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.2.0-rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.2.0-rc2" rel="nofollow" title="3.2.0-rc2">3.2.0-rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.2.0-rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.2.0-rc1" rel="nofollow" title="3.2.0-rc1">3.2.0-rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.2.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.2.0" rel="nofollow" title="3.2.0">3.2.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.1.1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.1.1" rel="nofollow" title="3.1.1">3.1.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.1.0-rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.1.0-rc2" rel="nofollow" title="3.1.0-rc2">3.1.0-rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.1.0-rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.1.0-rc1" rel="nofollow" title="3.1.0-rc1">3.1.0-rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.1.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.1.0" rel="nofollow" title="3.1.0">3.1.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.0.2-rc3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.0.2-rc3" rel="nofollow" title="3.0.2-rc3">3.0.2-rc3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.0.2-rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.0.2-rc2" rel="nofollow" title="3.0.2-rc2">3.0.2-rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.0.2-rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.0.2-rc1" rel="nofollow" title="3.0.2-rc1">3.0.2-rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.0.2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.0.2" rel="nofollow" title="3.0.2">3.0.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.0.1-rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.0.1-rc1" rel="nofollow" title="3.0.1-rc1">3.0.1-rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.0.1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.0.1" rel="nofollow" title="3.0.1">3.0.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.0.0-rc8/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.0.0-rc8" rel="nofollow" title="3.0.0-rc8">3.0.0-rc8</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.0.0-rc7/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.0.0-rc7" rel="nofollow" title="3.0.0-rc7">3.0.0-rc7</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.0.0-rc6/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.0.0-rc6" rel="nofollow" title="3.0.0-rc6">3.0.0-rc6</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.0.0-rc5/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.0.0-rc5" rel="nofollow" title="3.0.0-rc5">3.0.0-rc5</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.0.0-rc4/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.0.0-rc4" rel="nofollow" title="3.0.0-rc4">3.0.0-rc4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.0.0rc3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.0.0rc3" rel="nofollow" title="3.0.0rc3">3.0.0rc3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.0.0rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.0.0rc2" rel="nofollow" title="3.0.0rc2">3.0.0rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.0.0rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.0.0rc1" rel="nofollow" title="3.0.0rc1">3.0.0rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/3.0.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="3.0.0" rel="nofollow" title="3.0.0">3.0.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.21/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.21" rel="nofollow" title="2.7.21">2.7.21</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.20-rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.20-rc1" rel="nofollow" title="2.7.20-rc1">2.7.20-rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.20/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.20" rel="nofollow" title="2.7.20">2.7.20</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.19rc3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.19rc3" rel="nofollow" title="2.7.19rc3">2.7.19rc3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.19rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.19rc2" rel="nofollow" title="2.7.19rc2">2.7.19rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.19rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.19rc1" rel="nofollow" title="2.7.19rc1">2.7.19rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.19/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.19" rel="nofollow" title="2.7.19">2.7.19</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.18/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.18" rel="nofollow" title="2.7.18">2.7.18</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.17/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.17" rel="nofollow" title="2.7.17">2.7.17</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.16rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.16rc1" rel="nofollow" title="2.7.16rc1">2.7.16rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.16/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.16" rel="nofollow" title="2.7.16">2.7.16</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.15rc4/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.15rc4" rel="nofollow" title="2.7.15rc4">2.7.15rc4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.15rc3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.15rc3" rel="nofollow" title="2.7.15rc3">2.7.15rc3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.15rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.15rc2" rel="nofollow" title="2.7.15rc2">2.7.15rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.15rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.15rc1" rel="nofollow" title="2.7.15rc1">2.7.15rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.14rc3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.14rc3" rel="nofollow" title="2.7.14rc3">2.7.14rc3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.14rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.14rc2" rel="nofollow" title="2.7.14rc2">2.7.14rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.14rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.14rc1" rel="nofollow" title="2.7.14rc1">2.7.14rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.14/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.14" rel="nofollow" title="2.7.14">2.7.14</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.13/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.13" rel="nofollow" title="2.7.13">2.7.13</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.12rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.12rc2" rel="nofollow" title="2.7.12rc2">2.7.12rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.12rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.12rc1" rel="nofollow" title="2.7.12rc1">2.7.12rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.12/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.12" rel="nofollow" title="2.7.12">2.7.12</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.11-1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.11-1" rel="nofollow" title="2.7.11-1">2.7.11-1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.10rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.10rc1" rel="nofollow" title="2.7.10rc1">2.7.10rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.10/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.10" rel="nofollow" title="2.7.10">2.7.10</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.9/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.9" rel="nofollow" title="2.7.9">2.7.9</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.8rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.8rc2" rel="nofollow" title="2.7.8rc2">2.7.8rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.8rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.8rc1" rel="nofollow" title="2.7.8rc1">2.7.8rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.8/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.8" rel="nofollow" title="2.7.8">2.7.8</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.7rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.7rc1" rel="nofollow" title="2.7.7rc1">2.7.7rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.7/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.7" rel="nofollow" title="2.7.7">2.7.7</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.6rc3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.6rc3" rel="nofollow" title="2.7.6rc3">2.7.6rc3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.6rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.6rc2" rel="nofollow" title="2.7.6rc2">2.7.6rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.6rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.6rc1" rel="nofollow" title="2.7.6rc1">2.7.6rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.6/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.6" rel="nofollow" title="2.7.6">2.7.6</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.5/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.5" rel="nofollow" title="2.7.5">2.7.5</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.4rc3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.4rc3" rel="nofollow" title="2.7.4rc3">2.7.4rc3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.4rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.4rc2" rel="nofollow" title="2.7.4rc2">2.7.4rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.4rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.4rc1" rel="nofollow" title="2.7.4rc1">2.7.4rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.4/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.4" rel="nofollow" title="2.7.4">2.7.4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.3rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.3rc1" rel="nofollow" title="2.7.3rc1">2.7.3rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.3.rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.3.rc1" rel="nofollow" title="2.7.3.rc1">2.7.3.rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.3" rel="nofollow" title="2.7.3">2.7.3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.2rc3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.2rc3" rel="nofollow" title="2.7.2rc3">2.7.2rc3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.2rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.2rc2" rel="nofollow" title="2.7.2rc2">2.7.2rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.2rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.2rc1" rel="nofollow" title="2.7.2rc1">2.7.2rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.1" rel="nofollow" title="2.7.1">2.7.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.0rc4/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.0rc4" rel="nofollow" title="2.7.0rc4">2.7.0rc4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.0rc3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.0rc3" rel="nofollow" title="2.7.0rc3">2.7.0rc3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.0rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.0rc2" rel="nofollow" title="2.7.0rc2">2.7.0rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.0rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.0rc1" rel="nofollow" title="2.7.0rc1">2.7.0rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.7.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.7.0" rel="nofollow" title="2.7.0">2.7.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.18/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.18" rel="nofollow" title="2.6.18">2.6.18</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.17/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.17" rel="nofollow" title="2.6.17">2.6.17</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.16/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.16" rel="nofollow" title="2.6.16">2.6.16</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.15/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.15" rel="nofollow" title="2.6.15">2.6.15</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.14/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.14" rel="nofollow" title="2.6.14">2.6.14</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.13rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.13rc1" rel="nofollow" title="2.6.13rc1">2.6.13rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.13/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.13" rel="nofollow" title="2.6.13">2.6.13</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.12/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.12" rel="nofollow" title="2.6.12">2.6.12</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.11/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.11" rel="nofollow" title="2.6.11">2.6.11</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.10/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.10" rel="nofollow" title="2.6.10">2.6.10</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.9rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.9rc1" rel="nofollow" title="2.6.9rc1">2.6.9rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.9/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.9" rel="nofollow" title="2.6.9">2.6.9</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.8rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.8rc1" rel="nofollow" title="2.6.8rc1">2.6.8rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.8/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.8" rel="nofollow" title="2.6.8">2.6.8</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.7rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.7rc1" rel="nofollow" title="2.6.7rc1">2.6.7rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.7/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.7" rel="nofollow" title="2.6.7">2.6.7</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.6rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.6rc1" rel="nofollow" title="2.6.6rc1">2.6.6rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.6/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.6" rel="nofollow" title="2.6.6">2.6.6</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.5rc5/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.5rc5" rel="nofollow" title="2.6.5rc5">2.6.5rc5</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.5rc4/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.5rc4" rel="nofollow" title="2.6.5rc4">2.6.5rc4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.5rc3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.5rc3" rel="nofollow" title="2.6.5rc3">2.6.5rc3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.5rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.5rc2" rel="nofollow" title="2.6.5rc2">2.6.5rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.5rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.5rc1" rel="nofollow" title="2.6.5rc1">2.6.5rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.5/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.5" rel="nofollow" title="2.6.5">2.6.5</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.4/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.4" rel="nofollow" title="2.6.4">2.6.4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.3rc3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.3rc3" rel="nofollow" title="2.6.3rc3">2.6.3rc3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.3rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.3rc2" rel="nofollow" title="2.6.3rc2">2.6.3rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.3rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.3rc1" rel="nofollow" title="2.6.3rc1">2.6.3rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.3" rel="nofollow" title="2.6.3">2.6.3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.2rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.2rc1" rel="nofollow" title="2.6.2rc1">2.6.2rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.2" rel="nofollow" title="2.6.2">2.6.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.1rc4/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.1rc4" rel="nofollow" title="2.6.1rc4">2.6.1rc4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.1rc3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.1rc3" rel="nofollow" title="2.6.1rc3">2.6.1rc3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.1rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.1rc2" rel="nofollow" title="2.6.1rc2">2.6.1rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.1rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.1rc1" rel="nofollow" title="2.6.1rc1">2.6.1rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.1" rel="nofollow" title="2.6.1">2.6.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.0rc4/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.0rc4" rel="nofollow" title="2.6.0rc4">2.6.0rc4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.0rc3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.0rc3" rel="nofollow" title="2.6.0rc3">2.6.0rc3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.0rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.0rc2" rel="nofollow" title="2.6.0rc2">2.6.0rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.0rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.0rc1" rel="nofollow" title="2.6.0rc1">2.6.0rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/2.6.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="2.6.0" rel="nofollow" title="2.6.0">2.6.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.6/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.6" rel="nofollow" title="0.25.6">0.25.6</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.5rc3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.5rc3" rel="nofollow" title="0.25.5rc3">0.25.5rc3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.5rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.5rc2" rel="nofollow" title="0.25.5rc2">0.25.5rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.5rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.5rc1" rel="nofollow" title="0.25.5rc1">0.25.5rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.5/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.5" rel="nofollow" title="0.25.5">0.25.5</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.4rc3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.4rc3" rel="nofollow" title="0.25.4rc3">0.25.4rc3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.4rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.4rc2" rel="nofollow" title="0.25.4rc2">0.25.4rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.4rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.4rc1" rel="nofollow" title="0.25.4rc1">0.25.4rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.4/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.4" rel="nofollow" title="0.25.4">0.25.4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.3" rel="nofollow" title="0.25.3">0.25.3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.2rc3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.2rc3" rel="nofollow" title="0.25.2rc3">0.25.2rc3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.2rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.2rc2" rel="nofollow" title="0.25.2rc2">0.25.2rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.2rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.2rc1" rel="nofollow" title="0.25.2rc1">0.25.2rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.2" rel="nofollow" title="0.25.2">0.25.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.1rc2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.1rc2" rel="nofollow" title="0.25.1rc2">0.25.1rc2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.1rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.1rc1" rel="nofollow" title="0.25.1rc1">0.25.1rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.1" rel="nofollow" title="0.25.1">0.25.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.0rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.0rc1" rel="nofollow" title="0.25.0rc1">0.25.0rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.0beta2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.0beta2" rel="nofollow" title="0.25.0beta2">0.25.0beta2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.0beta1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.0beta1" rel="nofollow" title="0.25.0beta1">0.25.0beta1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.25.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.25.0" rel="nofollow" title="0.25.0">0.25.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.24.9/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.24.9" rel="nofollow" title="0.24.9">0.24.9</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.24.8rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.24.8rc1" rel="nofollow" title="0.24.8rc1">0.24.8rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.24.8/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.24.8" rel="nofollow" title="0.24.8">0.24.8</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.24.7rc1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.24.7rc1" rel="nofollow" title="0.24.7rc1">0.24.7rc1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.24.7/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.24.7" rel="nofollow" title="0.24.7">0.24.7</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.24.6/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.24.6" rel="nofollow" title="0.24.6">0.24.6</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.24.5/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.24.5" rel="nofollow" title="0.24.5">0.24.5</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.24.4/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.24.4" rel="nofollow" title="0.24.4">0.24.4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.24.3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.24.3" rel="nofollow" title="0.24.3">0.24.3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.24.2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.24.2" rel="nofollow" title="0.24.2">0.24.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.24.1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.24.1" rel="nofollow" title="0.24.1">0.24.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.24.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.24.0" rel="nofollow" title="0.24.0">0.24.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.23.2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.23.2" rel="nofollow" title="0.23.2">0.23.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.23.1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.23.1" rel="nofollow" title="0.23.1">0.23.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.23.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.23.0" rel="nofollow" title="0.23.0">0.23.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.22.4/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.22.4" rel="nofollow" title="0.22.4">0.22.4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.22.3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.22.3" rel="nofollow" title="0.22.3">0.22.3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.22.2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.22.2" rel="nofollow" title="0.22.2">0.22.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.22.1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.22.1" rel="nofollow" title="0.22.1">0.22.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.22.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.22.0" rel="nofollow" title="0.22.0">0.22.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.20.1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.20.1" rel="nofollow" title="0.20.1">0.20.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.20.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.20.0" rel="nofollow" title="0.20.0">0.20.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.19.3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.19.3" rel="nofollow" title="0.19.3">0.19.3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.19.2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.19.2" rel="nofollow" title="0.19.2">0.19.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.19.1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.19.1" rel="nofollow" title="0.19.1">0.19.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.19.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.19.0" rel="nofollow" title="0.19.0">0.19.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.18.4/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.18.4" rel="nofollow" title="0.18.4">0.18.4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.18.3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.18.3" rel="nofollow" title="0.18.3">0.18.3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.18.2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.18.2" rel="nofollow" title="0.18.2">0.18.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.18.1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.18.1" rel="nofollow" title="0.18.1">0.18.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.18.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.18.0" rel="nofollow" title="0.18.0">0.18.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.17.2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.17.2" rel="nofollow" title="0.17.2">0.17.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.17.1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.17.1" rel="nofollow" title="0.17.1">0.17.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.17.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.17.0" rel="nofollow" title="0.17.0">0.17.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.16.5/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.16.5" rel="nofollow" title="0.16.5">0.16.5</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.16.4/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.16.4" rel="nofollow" title="0.16.4">0.16.4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.16.3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.16.3" rel="nofollow" title="0.16.3">0.16.3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.16.2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.16.2" rel="nofollow" title="0.16.2">0.16.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.16.1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.16.1" rel="nofollow" title="0.16.1">0.16.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.16.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.16.0" rel="nofollow" title="0.16.0">0.16.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.15.3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.15.3" rel="nofollow" title="0.15.3">0.15.3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.15.2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.15.2" rel="nofollow" title="0.15.2">0.15.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.15.1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.15.1" rel="nofollow" title="0.15.1">0.15.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.15.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.15.0" rel="nofollow" title="0.15.0">0.15.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.14.1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.14.1" rel="nofollow" title="0.14.1">0.14.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.14.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.14.0" rel="nofollow" title="0.14.0">0.14.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.13.6/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.13.6" rel="nofollow" title="0.13.6">0.13.6</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.13.5/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.13.5" rel="nofollow" title="0.13.5">0.13.5</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.13.4/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.13.4" rel="nofollow" title="0.13.4">0.13.4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.13.2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.13.2" rel="nofollow" title="0.13.2">0.13.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.13.1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.13.1" rel="nofollow" title="0.13.1">0.13.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.13.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.13.0" rel="nofollow" title="0.13.0">0.13.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.12.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.12.0" rel="nofollow" title="0.12.0">0.12.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.11.2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.11.2" rel="nofollow" title="0.11.2">0.11.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.11.1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.11.1" rel="nofollow" title="0.11.1">0.11.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.11.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.11.0" rel="nofollow" title="0.11.0">0.11.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.10.2/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.10.2" rel="nofollow" title="0.10.2">0.10.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.10.1/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.10.1" rel="nofollow" title="0.10.1">0.10.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.10.0/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.10.0" rel="nofollow" title="0.10.0">0.10.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/puppetlabs/puppet/blob/0.9.3/lib/puppet/provider/zpool/zpool.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="0.9.3" rel="nofollow" title="0.9.3">0.9.3</a>
                </div> <!-- /.select-menu-item -->
            </div>

            <div class="select-menu-no-results">Nothing to show</div>

          </div> <!-- /.select-menu-list -->

        </div> <!-- /.select-menu-modal -->
      </div> <!-- /.select-menu-modal-holder -->
    </div> <!-- /.select-menu -->

  </div> <!-- /.scope -->

  <ul class="tabnav-tabs">
    <li><a href="/puppetlabs/puppet" class="selected js-selected-navigation-item tabnav-tab" data-selected-links="repo_source /puppetlabs/puppet">Files</a></li>
    <li><a href="/puppetlabs/puppet/commits/master" class="js-selected-navigation-item tabnav-tab" data-selected-links="repo_commits /puppetlabs/puppet/commits/master">Commits</a></li>
    <li><a href="/puppetlabs/puppet/branches" class="js-selected-navigation-item tabnav-tab" data-selected-links="repo_branches /puppetlabs/puppet/branches" rel="nofollow">Branches <span class="counter ">9</span></a></li>
  </ul>

</div>

  
  
  


            
          </div>
        </div><!-- /.repohead -->

        <div id="js-repo-pjax-container" class="container context-loader-container" data-pjax-container>
          


<!-- blob contrib key: blob_contributors:v21:6c7b9b6b6fbf18a23e6222e6e870d950 -->
<!-- blob contrib frag key: views10/v8/blob_contributors:v21:6c7b9b6b6fbf18a23e6222e6e870d950 -->


<div id="slider">
    <div class="frame-meta">

      <p title="This is a placeholder element" class="js-history-link-replace hidden"></p>

        <div class="breadcrumb">
          <span class='bold'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/puppetlabs/puppet" class="js-slide-to" data-branch="master" data-direction="back" itemscope="url"><span itemprop="title">puppet</span></a></span></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/puppetlabs/puppet/tree/master/lib" class="js-slide-to" data-branch="master" data-direction="back" itemscope="url"><span itemprop="title">lib</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/puppetlabs/puppet/tree/master/lib/puppet" class="js-slide-to" data-branch="master" data-direction="back" itemscope="url"><span itemprop="title">puppet</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/puppetlabs/puppet/tree/master/lib/puppet/provider" class="js-slide-to" data-branch="master" data-direction="back" itemscope="url"><span itemprop="title">provider</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/puppetlabs/puppet/tree/master/lib/puppet/provider/zpool" class="js-slide-to" data-branch="master" data-direction="back" itemscope="url"><span itemprop="title">zpool</span></a></span><span class="separator"> / </span><strong class="final-path">zpool.rb</strong> <span class="js-zeroclipboard zeroclipboard-button" data-clipboard-text="lib/puppet/provider/zpool/zpool.rb" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
        </div>

      <a href="/puppetlabs/puppet/find/master" class="js-slide-to" data-hotkey="t" style="display:none">Show File Finder</a>


        
  <div class="commit file-history-tease">
    <img class="main-avatar" height="24" src="https://secure.gravatar.com/avatar/e18c99591ac05ab1d5c29735fa8ab91f?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
    <span class="author"><a href="/joshcooper" rel="author">joshcooper</a></span>
    <time class="js-relative-date" datetime="2012-11-15T17:00:36-08:00" title="2012-11-15 17:00:36">November 15, 2012</time>
    <div class="commit-title">
        <a href="/puppetlabs/puppet/commit/490a721db83d7945ce9e6ca02174820edaf5fce8" class="message">(#17007) Make failonfail and combine explicit</a>
    </div>

    <div class="participation">
      <p class="quickstat"><a href="#blob_contributors_box" rel="facebox"><strong>2</strong> contributors</a></p>
          <a class="avatar tooltipped downwards" title="joshcooper" href="/puppetlabs/puppet/commits/master/lib/puppet/provider/zpool/zpool.rb?author=joshcooper"><img height="20" src="https://secure.gravatar.com/avatar/e18c99591ac05ab1d5c29735fa8ab91f?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /></a>
    <a class="avatar tooltipped downwards" title="mfournier" href="/puppetlabs/puppet/commits/master/lib/puppet/provider/zpool/zpool.rb?author=mfournier"><img height="20" src="https://secure.gravatar.com/avatar/d41d8cd98f00b204e9800998ecf8427e?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /></a>


    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2>Users on GitHub who have contributed to this file</h2>
      <ul class="facebox-user-list">
        <li>
          <img height="24" src="https://secure.gravatar.com/avatar/e18c99591ac05ab1d5c29735fa8ab91f?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/joshcooper">joshcooper</a>
        </li>
        <li>
          <img height="24" src="https://secure.gravatar.com/avatar/d41d8cd98f00b204e9800998ecf8427e?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/mfournier">mfournier</a>
        </li>
      </ul>
    </div>
  </div>


    </div><!-- ./.frame-meta -->

    <div class="frames">
      <div class="frame" data-permalink-url="/puppetlabs/puppet/blob/2dd097c08d6e2675526488e9196798cf4bfdad96/lib/puppet/provider/zpool/zpool.rb" data-title="puppet/lib/puppet/provider/zpool/zpool.rb at master · puppetlabs/puppet · GitHub" data-type="blob">

        <div id="files" class="bubble">
          <div class="file">
            <div class="meta">
              <div class="info">
                <span class="icon"><b class="octicon octicon-file-text"></b></span>
                <span class="mode" title="File Mode">file</span>
                  <span>121 lines (100 sloc)</span>
                <span>2.944 kb</span>
              </div>
              <div class="actions">
                <div class="button-group">
                      <a class="minibutton js-entice" href=""
                         data-entice="You must be signed in and on a branch to make or propose changes">Edit</a>
                  <a href="/puppetlabs/puppet/raw/master/lib/puppet/provider/zpool/zpool.rb" class="button minibutton " id="raw-url">Raw</a>
                    <a href="/puppetlabs/puppet/blame/master/lib/puppet/provider/zpool/zpool.rb" class="button minibutton ">Blame</a>
                  <a href="/puppetlabs/puppet/commits/master/lib/puppet/provider/zpool/zpool.rb" class="button minibutton " rel="nofollow">History</a>
                </div><!-- /.button-group -->
              </div><!-- /.actions -->

            </div>
                <div class="blob-wrapper data type-ruby js-blob-data">
      <table class="file-code file-diff">
        <tr class="file-code-line">
          <td class="blob-line-nums">
            <span id="L1" rel="#L1">1</span>
<span id="L2" rel="#L2">2</span>
<span id="L3" rel="#L3">3</span>
<span id="L4" rel="#L4">4</span>
<span id="L5" rel="#L5">5</span>
<span id="L6" rel="#L6">6</span>
<span id="L7" rel="#L7">7</span>
<span id="L8" rel="#L8">8</span>
<span id="L9" rel="#L9">9</span>
<span id="L10" rel="#L10">10</span>
<span id="L11" rel="#L11">11</span>
<span id="L12" rel="#L12">12</span>
<span id="L13" rel="#L13">13</span>
<span id="L14" rel="#L14">14</span>
<span id="L15" rel="#L15">15</span>
<span id="L16" rel="#L16">16</span>
<span id="L17" rel="#L17">17</span>
<span id="L18" rel="#L18">18</span>
<span id="L19" rel="#L19">19</span>
<span id="L20" rel="#L20">20</span>
<span id="L21" rel="#L21">21</span>
<span id="L22" rel="#L22">22</span>
<span id="L23" rel="#L23">23</span>
<span id="L24" rel="#L24">24</span>
<span id="L25" rel="#L25">25</span>
<span id="L26" rel="#L26">26</span>
<span id="L27" rel="#L27">27</span>
<span id="L28" rel="#L28">28</span>
<span id="L29" rel="#L29">29</span>
<span id="L30" rel="#L30">30</span>
<span id="L31" rel="#L31">31</span>
<span id="L32" rel="#L32">32</span>
<span id="L33" rel="#L33">33</span>
<span id="L34" rel="#L34">34</span>
<span id="L35" rel="#L35">35</span>
<span id="L36" rel="#L36">36</span>
<span id="L37" rel="#L37">37</span>
<span id="L38" rel="#L38">38</span>
<span id="L39" rel="#L39">39</span>
<span id="L40" rel="#L40">40</span>
<span id="L41" rel="#L41">41</span>
<span id="L42" rel="#L42">42</span>
<span id="L43" rel="#L43">43</span>
<span id="L44" rel="#L44">44</span>
<span id="L45" rel="#L45">45</span>
<span id="L46" rel="#L46">46</span>
<span id="L47" rel="#L47">47</span>
<span id="L48" rel="#L48">48</span>
<span id="L49" rel="#L49">49</span>
<span id="L50" rel="#L50">50</span>
<span id="L51" rel="#L51">51</span>
<span id="L52" rel="#L52">52</span>
<span id="L53" rel="#L53">53</span>
<span id="L54" rel="#L54">54</span>
<span id="L55" rel="#L55">55</span>
<span id="L56" rel="#L56">56</span>
<span id="L57" rel="#L57">57</span>
<span id="L58" rel="#L58">58</span>
<span id="L59" rel="#L59">59</span>
<span id="L60" rel="#L60">60</span>
<span id="L61" rel="#L61">61</span>
<span id="L62" rel="#L62">62</span>
<span id="L63" rel="#L63">63</span>
<span id="L64" rel="#L64">64</span>
<span id="L65" rel="#L65">65</span>
<span id="L66" rel="#L66">66</span>
<span id="L67" rel="#L67">67</span>
<span id="L68" rel="#L68">68</span>
<span id="L69" rel="#L69">69</span>
<span id="L70" rel="#L70">70</span>
<span id="L71" rel="#L71">71</span>
<span id="L72" rel="#L72">72</span>
<span id="L73" rel="#L73">73</span>
<span id="L74" rel="#L74">74</span>
<span id="L75" rel="#L75">75</span>
<span id="L76" rel="#L76">76</span>
<span id="L77" rel="#L77">77</span>
<span id="L78" rel="#L78">78</span>
<span id="L79" rel="#L79">79</span>
<span id="L80" rel="#L80">80</span>
<span id="L81" rel="#L81">81</span>
<span id="L82" rel="#L82">82</span>
<span id="L83" rel="#L83">83</span>
<span id="L84" rel="#L84">84</span>
<span id="L85" rel="#L85">85</span>
<span id="L86" rel="#L86">86</span>
<span id="L87" rel="#L87">87</span>
<span id="L88" rel="#L88">88</span>
<span id="L89" rel="#L89">89</span>
<span id="L90" rel="#L90">90</span>
<span id="L91" rel="#L91">91</span>
<span id="L92" rel="#L92">92</span>
<span id="L93" rel="#L93">93</span>
<span id="L94" rel="#L94">94</span>
<span id="L95" rel="#L95">95</span>
<span id="L96" rel="#L96">96</span>
<span id="L97" rel="#L97">97</span>
<span id="L98" rel="#L98">98</span>
<span id="L99" rel="#L99">99</span>
<span id="L100" rel="#L100">100</span>
<span id="L101" rel="#L101">101</span>
<span id="L102" rel="#L102">102</span>
<span id="L103" rel="#L103">103</span>
<span id="L104" rel="#L104">104</span>
<span id="L105" rel="#L105">105</span>
<span id="L106" rel="#L106">106</span>
<span id="L107" rel="#L107">107</span>
<span id="L108" rel="#L108">108</span>
<span id="L109" rel="#L109">109</span>
<span id="L110" rel="#L110">110</span>
<span id="L111" rel="#L111">111</span>
<span id="L112" rel="#L112">112</span>
<span id="L113" rel="#L113">113</span>
<span id="L114" rel="#L114">114</span>
<span id="L115" rel="#L115">115</span>
<span id="L116" rel="#L116">116</span>
<span id="L117" rel="#L117">117</span>
<span id="L118" rel="#L118">118</span>
<span id="L119" rel="#L119">119</span>
<span id="L120" rel="#L120">120</span>

          </td>
          <td class="blob-line-code">
                  <div class="highlight"><pre><div class='line' id='LC1'><span class="ss">Puppet</span><span class="p">:</span><span class="ss">:Type</span><span class="o">.</span><span class="n">type</span><span class="p">(</span><span class="ss">:zpool</span><span class="p">)</span><span class="o">.</span><span class="n">provide</span><span class="p">(</span><span class="ss">:zpool</span><span class="p">)</span> <span class="k">do</span></div><div class='line' id='LC2'>&nbsp;&nbsp;<span class="n">desc</span> <span class="s2">&quot;Provider for zpool.&quot;</span></div><div class='line' id='LC3'><br/></div><div class='line' id='LC4'>&nbsp;&nbsp;<span class="n">commands</span> <span class="ss">:zpool</span> <span class="o">=&gt;</span> <span class="s1">&#39;zpool&#39;</span></div><div class='line' id='LC5'><br/></div><div class='line' id='LC6'>&nbsp;&nbsp;<span class="c1">#NAME    SIZE  ALLOC   FREE    CAP  HEALTH  ALTROOT</span></div><div class='line' id='LC7'>&nbsp;&nbsp;<span class="k">def</span> <span class="nc">self</span><span class="o">.</span><span class="nf">instances</span></div><div class='line' id='LC8'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">zpool</span><span class="p">(</span><span class="ss">:list</span><span class="p">,</span> <span class="s1">&#39;-H&#39;</span><span class="p">)</span><span class="o">.</span><span class="n">split</span><span class="p">(</span><span class="s2">&quot;</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">)</span><span class="o">.</span><span class="n">collect</span> <span class="k">do</span> <span class="o">|</span><span class="n">line</span><span class="o">|</span></div><div class='line' id='LC9'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">name</span><span class="p">,</span> <span class="n">size</span><span class="p">,</span> <span class="n">alloc</span><span class="p">,</span> <span class="n">free</span><span class="p">,</span> <span class="n">cap</span><span class="p">,</span> <span class="n">health</span><span class="p">,</span> <span class="n">altroot</span> <span class="o">=</span> <span class="n">line</span><span class="o">.</span><span class="n">split</span><span class="p">(</span><span class="sr">/\s+/</span><span class="p">)</span></div><div class='line' id='LC10'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kp">new</span><span class="p">({</span><span class="ss">:name</span> <span class="o">=&gt;</span> <span class="nb">name</span><span class="p">,</span> <span class="ss">:ensure</span> <span class="o">=&gt;</span> <span class="ss">:present</span><span class="p">})</span></div><div class='line' id='LC11'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC12'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC13'><br/></div><div class='line' id='LC14'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">process_zpool_data</span><span class="p">(</span><span class="n">pool_array</span><span class="p">)</span></div><div class='line' id='LC15'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="n">pool_array</span> <span class="o">==</span> <span class="o">[]</span></div><div class='line' id='LC16'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="no">Hash</span><span class="o">.</span><span class="n">new</span><span class="p">(</span><span class="ss">:absent</span><span class="p">)</span></div><div class='line' id='LC17'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC18'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#get the name and get rid of it</span></div><div class='line' id='LC19'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">pool</span> <span class="o">=</span> <span class="no">Hash</span><span class="o">.</span><span class="n">new</span></div><div class='line' id='LC20'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">pool</span><span class="o">[</span><span class="ss">:pool</span><span class="o">]</span> <span class="o">=</span> <span class="n">pool_array</span><span class="o">[</span><span class="mi">0</span><span class="o">]</span></div><div class='line' id='LC21'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">pool_array</span><span class="o">.</span><span class="n">shift</span></div><div class='line' id='LC22'><br/></div><div class='line' id='LC23'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">tmp</span> <span class="o">=</span> <span class="o">[]</span></div><div class='line' id='LC24'><br/></div><div class='line' id='LC25'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#order matters here :(</span></div><div class='line' id='LC26'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">pool_array</span><span class="o">.</span><span class="n">reverse</span><span class="o">.</span><span class="n">each</span> <span class="k">do</span> <span class="o">|</span><span class="n">value</span><span class="o">|</span></div><div class='line' id='LC27'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">sym</span> <span class="o">=</span> <span class="kp">nil</span></div><div class='line' id='LC28'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">case</span> <span class="n">value</span></div><div class='line' id='LC29'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">when</span> <span class="s2">&quot;spares&quot;</span><span class="p">;</span></div><div class='line' id='LC30'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">sym</span> <span class="o">=</span> <span class="ss">:spare</span></div><div class='line' id='LC31'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">when</span> <span class="s2">&quot;logs&quot;</span><span class="p">;</span></div><div class='line' id='LC32'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">sym</span> <span class="o">=</span> <span class="ss">:log</span></div><div class='line' id='LC33'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">when</span> <span class="sr">/^mirror|^raidz1|^raidz2/</span><span class="p">;</span></div><div class='line' id='LC34'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">sym</span> <span class="o">=</span> <span class="n">value</span> <span class="o">=~</span> <span class="sr">/^mirror/</span> <span class="p">?</span> <span class="ss">:mirror</span> <span class="p">:</span> <span class="ss">:raidz</span></div><div class='line' id='LC35'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">pool</span><span class="o">[</span><span class="ss">:raid_parity</span><span class="o">]</span> <span class="o">=</span> <span class="s2">&quot;raidz2&quot;</span> <span class="k">if</span> <span class="n">value</span> <span class="o">=~</span> <span class="sr">/^raidz2/</span></div><div class='line' id='LC36'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span></div><div class='line' id='LC37'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">tmp</span> <span class="o">&lt;&lt;</span> <span class="n">value</span></div><div class='line' id='LC38'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">sym</span> <span class="o">=</span> <span class="ss">:disk</span> <span class="k">if</span> <span class="n">value</span> <span class="o">==</span> <span class="n">pool_array</span><span class="o">.</span><span class="n">first</span></div><div class='line' id='LC39'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC40'><br/></div><div class='line' id='LC41'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="n">sym</span></div><div class='line' id='LC42'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">pool</span><span class="o">[</span><span class="n">sym</span><span class="o">]</span> <span class="o">=</span> <span class="n">pool</span><span class="o">[</span><span class="n">sym</span><span class="o">]</span> <span class="p">?</span> <span class="n">pool</span><span class="o">[</span><span class="n">sym</span><span class="o">].</span><span class="n">unshift</span><span class="p">(</span><span class="n">tmp</span><span class="o">.</span><span class="n">reverse</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="s1">&#39; &#39;</span><span class="p">))</span> <span class="p">:</span> <span class="o">[</span><span class="n">tmp</span><span class="o">.</span><span class="n">reverse</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="s1">&#39; &#39;</span><span class="p">)</span><span class="o">]</span></div><div class='line' id='LC43'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">tmp</span><span class="o">.</span><span class="n">clear</span></div><div class='line' id='LC44'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC45'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC46'><br/></div><div class='line' id='LC47'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">pool</span></div><div class='line' id='LC48'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC49'><br/></div><div class='line' id='LC50'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">get_pool_data</span></div><div class='line' id='LC51'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># http://docs.oracle.com/cd/E19082-01/817-2271/gbcve/index.html</span></div><div class='line' id='LC52'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># we could also use zpool iostat -v mypool for a (little bit) cleaner output</span></div><div class='line' id='LC53'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">out</span> <span class="o">=</span> <span class="n">execute</span><span class="p">(</span><span class="s2">&quot;zpool status </span><span class="si">#{</span><span class="vi">@resource</span><span class="o">[</span><span class="ss">:pool</span><span class="o">]</span><span class="si">}</span><span class="s2">&quot;</span><span class="p">,</span> <span class="ss">:failonfail</span> <span class="o">=&gt;</span> <span class="kp">false</span><span class="p">,</span> <span class="ss">:combine</span> <span class="o">=&gt;</span> <span class="kp">false</span><span class="p">)</span></div><div class='line' id='LC54'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">zpool_data</span> <span class="o">=</span> <span class="n">out</span><span class="o">.</span><span class="n">lines</span><span class="o">.</span><span class="n">select</span> <span class="p">{</span> <span class="o">|</span><span class="n">line</span><span class="o">|</span> <span class="n">line</span><span class="o">.</span><span class="n">index</span><span class="p">(</span><span class="s2">&quot;</span><span class="se">\t</span><span class="s2">&quot;</span><span class="p">)</span> <span class="o">==</span> <span class="mi">0</span> <span class="p">}</span><span class="o">.</span><span class="n">collect</span> <span class="p">{</span> <span class="o">|</span><span class="n">l</span><span class="o">|</span> <span class="n">l</span><span class="o">.</span><span class="n">strip</span><span class="o">.</span><span class="n">split</span><span class="p">(</span><span class="s2">&quot;</span><span class="se">\s</span><span class="s2">&quot;</span><span class="p">)</span><span class="o">[</span><span class="mi">0</span><span class="o">]</span> <span class="p">}</span></div><div class='line' id='LC55'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">zpool_data</span><span class="o">.</span><span class="n">shift</span></div><div class='line' id='LC56'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">zpool_data</span></div><div class='line' id='LC57'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC58'><br/></div><div class='line' id='LC59'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">current_pool</span></div><div class='line' id='LC60'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@current_pool</span> <span class="o">=</span> <span class="n">process_zpool_data</span><span class="p">(</span><span class="n">get_pool_data</span><span class="p">)</span> <span class="k">unless</span> <span class="p">(</span><span class="n">defined?</span><span class="p">(</span><span class="vi">@current_pool</span><span class="p">)</span> <span class="ow">and</span> <span class="vi">@current_pool</span><span class="p">)</span></div><div class='line' id='LC61'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@current_pool</span></div><div class='line' id='LC62'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC63'><br/></div><div class='line' id='LC64'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">flush</span></div><div class='line' id='LC65'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@current_pool</span><span class="o">=</span> <span class="kp">nil</span></div><div class='line' id='LC66'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC67'><br/></div><div class='line' id='LC68'>&nbsp;&nbsp;<span class="c1">#Adds log and spare</span></div><div class='line' id='LC69'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">build_named</span><span class="p">(</span><span class="nb">name</span><span class="p">)</span></div><div class='line' id='LC70'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="n">prop</span> <span class="o">=</span> <span class="vi">@resource</span><span class="o">[</span><span class="nb">name</span><span class="o">.</span><span class="n">intern</span><span class="o">]</span></div><div class='line' id='LC71'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="o">[</span><span class="nb">name</span><span class="o">]</span> <span class="o">+</span> <span class="n">prop</span><span class="o">.</span><span class="n">collect</span> <span class="p">{</span> <span class="o">|</span><span class="nb">p</span><span class="o">|</span> <span class="nb">p</span><span class="o">.</span><span class="n">split</span><span class="p">(</span><span class="s1">&#39; &#39;</span><span class="p">)</span> <span class="p">}</span><span class="o">.</span><span class="n">flatten</span></div><div class='line' id='LC72'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span></div><div class='line' id='LC73'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="o">[]</span></div><div class='line' id='LC74'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC75'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC76'><br/></div><div class='line' id='LC77'>&nbsp;&nbsp;<span class="c1">#query for parity and set the right string</span></div><div class='line' id='LC78'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">raidzarity</span></div><div class='line' id='LC79'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@resource</span><span class="o">[</span><span class="ss">:raid_parity</span><span class="o">]</span> <span class="p">?</span> <span class="vi">@resource</span><span class="o">[</span><span class="ss">:raid_parity</span><span class="o">]</span> <span class="p">:</span> <span class="s2">&quot;raidz1&quot;</span></div><div class='line' id='LC80'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC81'><br/></div><div class='line' id='LC82'>&nbsp;&nbsp;<span class="c1">#builds up the vdevs for create command</span></div><div class='line' id='LC83'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">build_vdevs</span></div><div class='line' id='LC84'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="n">disk</span> <span class="o">=</span> <span class="vi">@resource</span><span class="o">[</span><span class="ss">:disk</span><span class="o">]</span></div><div class='line' id='LC85'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">disk</span><span class="o">.</span><span class="n">collect</span> <span class="p">{</span> <span class="o">|</span><span class="n">d</span><span class="o">|</span> <span class="n">d</span><span class="o">.</span><span class="n">split</span><span class="p">(</span><span class="s1">&#39; &#39;</span><span class="p">)</span> <span class="p">}</span><span class="o">.</span><span class="n">flatten</span></div><div class='line' id='LC86'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">elsif</span> <span class="n">mirror</span> <span class="o">=</span> <span class="vi">@resource</span><span class="o">[</span><span class="ss">:mirror</span><span class="o">]</span></div><div class='line' id='LC87'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="o">[</span><span class="s2">&quot;mirror&quot;</span><span class="o">]</span> <span class="o">+</span>  <span class="n">mirror</span></div><div class='line' id='LC88'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">elsif</span> <span class="n">raidz</span> <span class="o">=</span> <span class="vi">@resource</span><span class="o">[</span><span class="ss">:raidz</span><span class="o">]</span></div><div class='line' id='LC89'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="o">[</span><span class="n">raidzarity</span><span class="o">]</span> <span class="o">+</span> <span class="n">raidz</span></div><div class='line' id='LC90'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC91'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC92'><br/></div><div class='line' id='LC93'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">create</span></div><div class='line' id='LC94'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">zpool</span><span class="p">(</span><span class="o">*</span><span class="p">(</span><span class="o">[</span><span class="ss">:create</span><span class="p">,</span> <span class="vi">@resource</span><span class="o">[</span><span class="ss">:pool</span><span class="o">]]</span> <span class="o">+</span> <span class="n">build_vdevs</span> <span class="o">+</span> <span class="n">build_named</span><span class="p">(</span><span class="s2">&quot;spare&quot;</span><span class="p">)</span> <span class="o">+</span> <span class="n">build_named</span><span class="p">(</span><span class="s2">&quot;log&quot;</span><span class="p">)))</span></div><div class='line' id='LC95'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC96'><br/></div><div class='line' id='LC97'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">destroy</span></div><div class='line' id='LC98'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">zpool</span> <span class="ss">:destroy</span><span class="p">,</span> <span class="vi">@resource</span><span class="o">[</span><span class="ss">:pool</span><span class="o">]</span></div><div class='line' id='LC99'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC100'><br/></div><div class='line' id='LC101'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">exists?</span></div><div class='line' id='LC102'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="n">current_pool</span><span class="o">[</span><span class="ss">:pool</span><span class="o">]</span> <span class="o">==</span> <span class="ss">:absent</span></div><div class='line' id='LC103'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kp">false</span></div><div class='line' id='LC104'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span></div><div class='line' id='LC105'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kp">true</span></div><div class='line' id='LC106'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC107'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC108'><br/></div><div class='line' id='LC109'>&nbsp;&nbsp;<span class="o">[</span><span class="ss">:disk</span><span class="p">,</span> <span class="ss">:mirror</span><span class="p">,</span> <span class="ss">:raidz</span><span class="p">,</span> <span class="ss">:log</span><span class="p">,</span> <span class="ss">:spare</span><span class="o">].</span><span class="n">each</span> <span class="k">do</span> <span class="o">|</span><span class="n">field</span><span class="o">|</span></div><div class='line' id='LC110'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">define_method</span><span class="p">(</span><span class="n">field</span><span class="p">)</span> <span class="k">do</span></div><div class='line' id='LC111'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">current_pool</span><span class="o">[</span><span class="n">field</span><span class="o">]</span></div><div class='line' id='LC112'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC113'><br/></div><div class='line' id='LC114'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">define_method</span><span class="p">(</span><span class="n">field</span><span class="o">.</span><span class="n">to_s</span> <span class="o">+</span> <span class="s2">&quot;=&quot;</span><span class="p">)</span> <span class="k">do</span> <span class="o">|</span><span class="n">should</span><span class="o">|</span></div><div class='line' id='LC115'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">self</span><span class="o">.</span><span class="n">fail</span> <span class="s2">&quot;zpool </span><span class="si">#{</span><span class="n">field</span><span class="si">}</span><span class="s2"> can&#39;t be changed. should be </span><span class="si">#{</span><span class="n">should</span><span class="si">}</span><span class="s2">, currently is </span><span class="si">#{</span><span class="n">current_pool</span><span class="o">[</span><span class="n">field</span><span class="o">]</span><span class="si">}</span><span class="s2">&quot;</span></div><div class='line' id='LC116'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC117'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC118'><br/></div><div class='line' id='LC119'><span class="k">end</span></div><div class='line' id='LC120'><br/></div></pre></div>
          </td>
        </tr>
      </table>
  </div>

          </div>
        </div>

        <a href="#jump-to-line" rel="facebox" data-hotkey="l" class="js-jump-to-line" style="display:none">Jump to Line</a>
        <div id="jump-to-line" style="display:none">
          <h2>Jump to Line</h2>
          <form accept-charset="UTF-8" class="js-jump-to-line-form">
            <input class="textfield js-jump-to-line-field" type="text">
            <div class="full-button">
              <button type="submit" class="button">Go</button>
            </div>
          </form>
        </div>

      </div>
    </div>
</div>

<div id="js-frame-loading-template" class="frame frame-loading large-loading-area" style="display:none;">
  <img class="js-frame-loading-spinner" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-128.gif?1347543527" height="64" width="64">
</div>


        </div>
      </div>
      <div class="modal-backdrop"></div>
    </div>

      <div id="footer-push"></div><!-- hack for sticky footer -->
    </div><!-- end of wrapper - hack for sticky footer -->

      <!-- footer -->
      <div id="footer">
  <div class="container clearfix">

      <dl class="footer_nav">
        <dt>GitHub</dt>
        <dd><a href="https://github.com/about">About us</a></dd>
        <dd><a href="https://github.com/blog">Blog</a></dd>
        <dd><a href="https://github.com/contact">Contact &amp; support</a></dd>
        <dd><a href="http://enterprise.github.com/">GitHub Enterprise</a></dd>
        <dd><a href="http://status.github.com/">Site status</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>Applications</dt>
        <dd><a href="http://mac.github.com/">GitHub for Mac</a></dd>
        <dd><a href="http://windows.github.com/">GitHub for Windows</a></dd>
        <dd><a href="http://eclipse.github.com/">GitHub for Eclipse</a></dd>
        <dd><a href="http://mobile.github.com/">GitHub mobile apps</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>Services</dt>
        <dd><a href="http://get.gaug.es/">Gauges: Web analytics</a></dd>
        <dd><a href="http://speakerdeck.com">Speaker Deck: Presentations</a></dd>
        <dd><a href="https://gist.github.com">Gist: Code snippets</a></dd>
        <dd><a href="http://jobs.github.com/">Job board</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>Documentation</dt>
        <dd><a href="http://help.github.com/">GitHub Help</a></dd>
        <dd><a href="http://developer.github.com/">Developer API</a></dd>
        <dd><a href="http://github.github.com/github-flavored-markdown/">GitHub Flavored Markdown</a></dd>
        <dd><a href="http://pages.github.com/">GitHub Pages</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>More</dt>
        <dd><a href="http://training.github.com/">Training</a></dd>
        <dd><a href="https://github.com/edu">Students &amp; teachers</a></dd>
        <dd><a href="http://shop.github.com">The Shop</a></dd>
        <dd><a href="https://github.com/plans">Plans &amp; pricing</a></dd>
        <dd><a href="http://octodex.github.com/">The Octodex</a></dd>
      </dl>

      <hr class="footer-divider">


    <p class="right">&copy; 2013 <span title="0.06490s from fe18.rs.github.com">GitHub</span>, Inc. All rights reserved.</p>
    <a class="left" href="https://github.com/">
      <span class="mega-octicon octicon-mark-github"></span>
    </a>
    <ul id="legal">
        <li><a href="https://github.com/site/terms">Terms of Service</a></li>
        <li><a href="https://github.com/site/privacy">Privacy</a></li>
        <li><a href="https://github.com/security">Security</a></li>
    </ul>

  </div><!-- /.container -->

</div><!-- /.#footer -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-fullscreen-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="js-fullscreen-contents" placeholder="" data-suggester="fullscreen_suggester"></textarea>
          <div class="suggester-container">
              <div class="suggester fullscreen-suggester js-navigation-container" id="fullscreen_suggester"
                 data-url="/puppetlabs/puppet/suggestions/commit">
              </div>
          </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped leftwards" title="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped leftwards"
      title="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      Something went wrong with that request. Please try again.
      <a href="#" class="octicon octicon-remove-close ajax-error-dismiss"></a>
    </div>

    
    
    <span id='server_response_time' data-time='0.06529' data-host='fe18'></span>
    
  </body>
</html>

