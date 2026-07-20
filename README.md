# Grace Woods

Personal site for [graceannwoods.com](https://graceannwoods.com), published with GitHub Pages and Jekyll.

## Recovery page

The recovery page lives at `/recovery/`. Its copy is kept separately from the HTML so Grace only needs to edit one file:

- Content: `_data/recovery.yml`
- Editing guide: `RECOVERY_EDITING.md`
- Page template: `recovery/index.html`
- Isolated styles: `assets/css/recovery.css`

Run `ruby scripts/validate_recovery.rb` before previewing or publishing content changes.

## Local preview

Use Ruby 3.2 or newer.

```sh
bundle install
ruby scripts/validate_recovery.rb
bundle exec jekyll serve
```

Then open <http://127.0.0.1:4000/recovery/>.
