# How to setup this app

1. You will need to install Ruby, a good (but occasionally troublesome) solution for installing ruby is [RVM](https://rvm.io). 
2. We are using [Bundler](http://gembundler.com) to manage gems. Install Bundler
3. From the root directory of this project in the Terminal, run `bundle`. This will install all the needed gems.
4. After gems finish installing, run `rackup`, this will start the WEBrick server running the Sinatra app.
5. In your browser go to [http://localhost:9292](http://localhost:9292).

# Tips 'n stuff

- Using `rackup` you will need to restart the server anytime you change any of the application code, this does not apply to HTML/CSS.
- Instead of `rackup`, you can use `shotgun`, which just automatically restarts the server between each request, slower, but then you don't need to manually do it. (But, since you'll only need to be changing the HTML/CSS `rackup` should be better for you)