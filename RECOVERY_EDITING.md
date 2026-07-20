# Editing the recovery page

The recovery page is published at <https://graceannwoods.com/recovery/>.

All editable recovery copy lives in `_data/recovery.yml`. Ordinary content changes should not require editing HTML, CSS, or JavaScript.

## The two voices

Most text has two versions:

```yaml
title:
  healing: "Recovery updates"
  hate: "Complaint log"
```

`healing` is the default page. `hate` appears after clicking the leg button. Always keep both values present. The page reserves room for the longer version so changing modes does not move the layout.

## Updating current status

Edit these sections near the top of `_data/recovery.yml`:

- `site.note`: the revision line in the masthead
- `header.status`: Grace, recovery day, and mode label
- `header.headline`: the large headline
- `header.updated`: the short update below the headline

## Adding an update

Add the newest item first under `updates.entries`:

```yaml
updates:
  entries:
    - date: "July 20"
      text:
        healing: "A short update."
        hate: "The same update without manners."
```

The shorter Home-page list is separate. Update `home.log.latest` when an item should also appear on Home.

## Editing the schedule, journal, or help list

- Upcoming milestones: `home.log.upcoming`
- Journal entries: `journal.entries`
- Help categories: `help.columns`
- The story and recovery plan: `story`

Keep indentation in two-space increments. Quote text containing a colon. For longer paragraphs, use YAML's folded form:

```yaml
healing: >-
  This can wrap across several lines in the file and will render as one
  paragraph on the website.
```

## Note form

Set `settings.formspree_id` to the ID from Grace's Formspree form. While it remains `YOUR_FORM_ID`, the page renders normally but note submission does not work.

## Validate and preview

With Ruby 3.2 or newer:

```sh
bundle install
ruby scripts/validate_recovery.rb
bundle exec jekyll serve
```

Open <http://127.0.0.1:4000/recovery/>. Test both modes, every tab, the cat, and the note form before publishing.

Merging a pull request into `main` triggers GitHub Pages to rebuild the site.
