# References
- [1] http://guides.rubyonrails.org
- [2] https://www.railstutorial.org/book/beginning - the most complete Rails tutorial that I was able to find in web
- [3] https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one

# What is rails
https://www.railstutorial.org/book/beginning#sec-introduction
http://guides.rubyonrails.org/getting_started.html

# Aim of this tutorial
The aim of this short tutorial is the very basic introduction into rails development,
it is based on resources from [2] and [3]

# Create new API rails app
Commit: [ccba7cb63389e64911ffa6a608a966bdee2a1e41](https://github.com/tortuga-feliz/rails-tutorial/commit/ccba7cb63389e64911ffa6a608a966bdee2a1e41)

To create new rails app run
```
rails new rails-tutorial --api -T
```
Then run

```
rails -h
```
and check help to understand all the parameters

```
-T, [--skip-test], [--no-skip-test]                    # Skip test files
    [--api], [--no-api]                                # Preconfigure smaller stack for API only apps
```

`--api` option creates api-only app
It configures your application to use more limited set of middleware than normal.
It won't add any middleware needed for browser apps by default, for example cookies
support won't be added. When generating new resource, it will skip generating views,
helpers or assets associated with that resource [1]

`-T` skips Minitest as the default testing framework, `test` directory won't be added,
also test-helper won't be created
