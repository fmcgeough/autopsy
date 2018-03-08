# Autopsy

A post mortem tool inspired by Etsy's [Morgue](https://github.com/etsy/morgue).
Morgue was written in PHP. We wanted to convert it to Elixir and Phoenix
framework.

## Description

Autopsy is a straight-forward form-based capture tool for the most part but
has to include the following features:

* Google OAuth
* JIRA Integration
* Support for divisions (parts of a company) that may have different capture needs
* Dynamic form UI driven by database data that defines what to capture for a division
* File/image upload (storage to S3)
* Email Integration for sending tickler type alerts for unhandled issues found in post mortem.
* Google Calendar integration to allow a division to have a shared calendar used to capture events

