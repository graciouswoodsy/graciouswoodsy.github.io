# Repository handoff

This is Grace Woods's existing Jekyll site. Preserve the root site, blog, résumé, contact page, and `CNAME`.

## Recovery page contract

- Public route: `/recovery/`
- Editable copy: `_data/recovery.yml`
- Template: `recovery/index.html`
- Styles: `assets/css/recovery.css`
- Paired-mode include: `_includes/recovery/mood.html`
- Content validator: `scripts/validate_recovery.rb`

For copy, dates, milestones, journal entries, help requests, or mood-specific wording, edit `_data/recovery.yml` only. Do not duplicate content back into the template.

The `healing` and `hate` values deliberately render in the same grid cell so switching modes produces no layout shift. Preserve that invariant when changing markup or CSS.

## Local setup

Use Ruby 3.2 or newer. On a Mac with only the obsolete system Ruby, install a current Ruby with Homebrew or `mise`, then:

```sh
bundle install
ruby scripts/validate_recovery.rb
bundle exec jekyll serve
```

Open <http://127.0.0.1:4000/recovery/>.

Before proposing a change:

```sh
ruby scripts/validate_recovery.rb
bundle exec jekyll build --trace
```

Formspree remains intentionally unconfigured until `settings.formspree_id` is replaced in `_data/recovery.yml`.
