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

