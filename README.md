# Link Shortener

Simple hanami link shortener application.

## Installation

## Usage

```
curl -k -H "Content-Type: application/json" -X POST -d '{"url":"test.site"}' https://localhost:9292/create
```

## TODO list

- [ ] Update index page layout.
- [ ] Add filter logic. This needs for matching links by specific pattern.
- [ ] Add admin application for manage urls and filter.
- [x] Add redirection count metric for each link.
- [ ] Add some metrics to admin page (most popular sites, links, etc).

## Contributing
1. Fork it ( https://github.com/davydovanton/link-shortener/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
