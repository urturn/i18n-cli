# i18n-cli
This is a command line interface that help you to manage Rails localization files.

If you have a Rails application and you want to localized it into different languages you have basically 2 possibilities:
* Work with files (default with Rails)
* Use a third party gem that will provide UI interface and

Second solution is great but it can take time to integrate and then translators need to use a specific web interface to do translation.

Advantage of using files is that it is very easy to ship a file to a translator and let him just translate it. BUT it becomes a nightmare after more then one round between you and the translator. Because, your code always change and you often add new keys, remove others or even change the value of an existing key. So it become impossible to know what you need to translate in a specific language.

That' why we decided to build a gem that can manage export of file to translate and also import translated files in your project.

## Installation
```bash
$ gem install i18n-cli
```

## Usage

First you have to create a config file. From the rrot of your Rails app launch following command
```bash
$ i18n-cli setup
```

It will create a file called i18n-cli.yml in your rails config folder.
```yaml
---
:locales: fr
:rails_locale_path: /Users/julbmann/Documents/development/i18n-cli/config/locales
:ignored_files: ''
```

you have basically 3 configuration. 
* locales:The list of locales you want to translate into. It is a string that contains all locales with : between them: fr:nl:de
* rails_locale_path: the path where your localization files are
* ignored_files: an array of filename to ignore. If you dan't want to translate all yml files.

###Export sub command
First thing you will have to do is to export all files to translate for each languages. To do that just execute the following command:
```bach
$ i18n-cli export -l fr:it
```
If you don't specify -l all locales in the config files will be exported. This command will typically generate something like that:
```
outbox
|-fr
  |-source
    |- en.yml
  |-diffs
    |- 12456253.fr.yml
  |-news
    |- fr.yml
|-it
  |-source
    |- en.yml
  |-diffs
    |- 12456253.it.yml
  |-news
    |- it.yml
```
So, basically, for each language you have have 3 sub folders:

* source contains all english source that was used to generate the export. It is mandatory to keep thos file under your version control if you want then tobe able to export all keys that has changed (diffs).
* diffs contains files that have all keys that has changed and so that need to be re-translated. Each file has a prefix with a timestamp to avoid loosing some diff. Imagine you do 2 export one after the other, first one will generate a diff and second one will generate no diff. So we MUST not override  all the previous exported diff
* news contains files that have all new keys. This file has no prefix as it can be overriden everytime.

So you need to send all files from diffs and news folder to your translator.

###Import sub command