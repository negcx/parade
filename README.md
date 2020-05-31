# Parade

## Installation

Parade is just a shell script called `parade`. To install, you can simply download the script and place it in a directory. Parade expects the following environment variables:

- `PARADE_PATH` to point to a folder where `migrations.txt` (your list of migrations) and the `migrations` and `rollback` folders will live.
- `PARADE_DB` a default database name or URL. You can alternately pass the database as a command line argument.
- `PARADE_EDITOR` is an optional command line editor for opening migrations when they are created (e.g. `code`, `subl`, `vim`, etc.)

Once the shell script is downloaded, you will need to run `parade install` on your database(s) so that the Versioning schema and functions can be added to your database.

### Setup Script

I have provided an easy setup script that will download Parade and setup some nice defaults:

- Setup the path for Parade as `./sql` or allow you to change it
- Create or append to a `.env` file environment variables
- Add `.env` to `.gitignore`

## Why Parade?

Parade is a shell script to help create and manage migrations in pure SQL for PostgreSQL. You can commit Parade with your code and easily setup shell scripts on your deploy to ensure your migrations run.

I write applications using a number of different languages, tools, and frameworks. I prefer to write migrations in pure SQL as it gives me the greatest level of control and visibility into what is going to happen on the database. It's also a single language for me to remember for migrations, rather than having to learn the specific syntax of each framework I'm using.

Migrations from the shell in pure SQL are faster, easier to understand, and easier to manage than migrations that require the host language to run.

Parade is built on top of [Versioning](https://gitlab.com/depesz/Versioning) by Hubert Lubaczewski aka [depesz](https://gitlab.com/depesz) under the hood. His blog post [How to manage changes to your database?](https://www.depesz.com/2010/08/22/versioning/) describes the theory behind Versioning and using pure SQL to manage your migrations.

## Defaults

Parade has a number of sensible defaults in place which would be easy to change in the shell script itself on a project-to-project basis.

- `UUID`s as primary keys named for the table (e.g. `customer_id`)
- `created_at` and `updated_at` timestamps with the `TIMESTAMPTZ` type
- Trigger to automatically update the `created_at` timestamp
